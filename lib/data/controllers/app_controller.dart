import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:chronosmedic_app/data/entities/enfermedad_entity.dart';
import 'package:chronosmedic_app/data/entities/entities.dart';
import 'package:chronosmedic_app/data/entities/medicamentos.dart';
import 'package:chronosmedic_app/data/repository.dart';
import 'package:chronosmedic_app/data/schema/usuario.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppController extends GetxController {
  static AppController get to => Get.find<AppController>();
  final Repository respository;
  AppController({
    required this.respository,
  });

  /* 
  ? OBS
   */

  Rx<UsuarioEntity> usuario = UsuarioEntity(uuid: '').obs;

  Future<bool> isLoggedIn() async => await SupabaseAuth.instance.hasAccessToken;

  Future<bool> signInWithEmail(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final AuthResponse res = await respository.supabase.auth
            .signInWithPassword(email: email, password: password);

        final Session? session = res.session;
        print(session?.toJson());
        final User? user = res.user;
        print(user?.toJson());

        if (user != null) {
          return true;
        }
        return false;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final AuthResponse res = await respository.supabase.auth
            .signUp(email: email, password: password);
        print(res.toString());
        final Session? session = res.session;
        print(session?.toJson());
        final User? user = res.user;
        print(user?.toJson());

        if (user != null) {
          return true;
        }
        return false;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    await respository.supabase.auth.signOut();
  }

  /* 
@User  
   */

  String get currentUserUid => respository.supabase.auth.currentUser?.id ?? '';

/* 
@ Complete Profile
 */

  Future<bool> completeProfile(
    String displayName,
    int age,
    String phone,
    String? userSex,
    File? image,
  ) async {
    final user = respository.supabase.auth.currentUser;
    if (user == null) {
      return false;
    }

    if (image == null) {
      return false;
    }

    final String path = await respository.supabase.storage.from('users').upload(
          'users/${user.id}.png',
          image,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    final resp = await respository.supabase
        .from('users')
        .insert({
          'uuid': user.id,
          'email': user.email,
          'display_name': displayName,
          'age': age,
          'phoner_number': phone,
          'photo_url': path,
          'sex': userSex,
        })
        .then((value) => true)
        .catchError((onError) => false);

    return resp;
  }

  Future<bool> updateProfile(
    String displayName,
    String email,
    int age,
    String phone,
    String? userSex,
    File? image,
  ) async {
    final user = usuario.value;

    final String path = await respository.supabase.storage.from('users').update(
          'users/${user.uuid}.png',
          image!,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );

    final result = await respository.supabase
        .from('users')
        .upsert({
          'uuid': user.uuid,
          'email': email,
          'display_name': displayName,
          'age': age,
          'phoner_number': phone,
          'photo_url': path,
          'sex': userSex,
        })
        .then((value) => true)
        .catchError((onError) => false);

    if (result) {
      final usuarioSchema = await getUsuarioUUID(user.uuid);
      final Uint8List file = await respository.supabase.storage
          .from('users')
          .download('users/${usuarioSchema.uuid}.png');
      final isUsuarioDB =
          respository.objectBox.findUsuarioUUID(usuarioSchema.uuid);
      if (isUsuarioDB != null) {
        isUsuarioDB.displayname = usuarioSchema.displayname;
        isUsuarioDB.email = usuarioSchema.email;
        isUsuarioDB.age = usuarioSchema.age;
        isUsuarioDB.phonernumber = usuarioSchema.phonernumber;
        isUsuarioDB.photourl = base64Encode(file);
        isUsuarioDB.sex = usuarioSchema.sex;

        final userID = respository.objectBox.createUsuario(isUsuarioDB);

        final usuarioDB = respository.objectBox.getUsuario(userID);

        usuario.value = usuarioDB!;

        update();
      }
    } else {}

    return false;
  }

  getUser() async {
    final user = respository.supabase.auth.currentUser;
    if (user == null) {
      return;
    }

    final result = await respository.supabase
        .from('users')
        .select(
            'display_name,email,age,phoner_number,photo_url,sex,created_time,uuid')
        .eq('uuid', user.id)
        .single();
    final usuarioSchema = UsuarioSchema.fromJson(result);

    final Uint8List file = await respository.supabase.storage
        .from('users')
        .download('users/${user.id}.png');

    final usuarioEntity = UsuarioEntity(
      uuid: usuarioSchema.uuid,
      displayname: usuarioSchema.displayname,
      email: usuarioSchema.email,
      age: usuarioSchema.age,
      phonernumber: usuarioSchema.phonernumber,
      photourl: base64Encode(file),
      sex: usuarioSchema.sex,
      createdtime: usuarioSchema.createdtime,
    );

    final isUsuarioDB =
        respository.objectBox.findUsuarioUUID(usuarioSchema.uuid);

    if (isUsuarioDB == null) {
      final res = respository.objectBox.createUsuario(usuarioEntity);

      final usuarioResult = respository.objectBox.getUsuario(res);

      if (usuarioResult != null) {
        usuario.value = usuarioResult;
        update();
      }
    }
  }

  Future<UsuarioSchema> getUsuarioUUID(String uuid) async {
    final result = await respository.supabase
        .from('users')
        .select(
            'display_name,email,age,phoner_number,photo_url,sex,created_time,uuid')
        .eq('uuid', uuid)
        .single();
    return UsuarioSchema.fromJson(result);
  }

  insertSick(String enfer) {}

  getUsuario() {
    final user = respository.supabase.auth.currentUser;
    if (user == null) {
      return;
    }

    final isUsuarioDB = respository.objectBox.findUsuarioUUID(user.id);

    if (isUsuarioDB != null) {
      usuario.value = isUsuarioDB;
      usuario.value.enfermedadesUsu.forEach((element) {
        print(element.toJson());

        element.medicacmendosUsu.forEach((element) {
          print(element.toJson());
        });
      });
    }
  }
  /* 
  @ UploadData
   */

  createEnfMedi(
    String enfermedadController,
    String medicacmentoController,
    int cantidadController,
    int dosisController,
    List<String> dias,
    List<String> hours,
  ) {
    final enfermedad = EnfermedadEntity(nombre: enfermedadController);
    final enfermedadID =
        respository.objectBox.createEnfermedad(usuario.value, enfermedad);

    final enfermedadDB = respository.objectBox.getEnfermedad(enfermedadID);
    final medicamento = MedicamentosEntity(
        nombre: medicacmentoController,
        cantidad: cantidadController,
        dosis: dosisController,
        diasSemana: dias,
        hora: hours);
    final medicamentoID =
        respository.objectBox.createMedicamento(enfermedadDB!, medicamento);
    // print(medicacmentoController);
    // print(cantidadController);
    // print(dosisController);
    // print(dias);
    // print(hours);
  }
  // print(path);
}


  //   final isUsuarioDB = respository.objectBox.findUsuarioUUID(result.uuid);

  //   if (isUsuarioDB != null) {
  //     isUsuarioDB.age = usuarioSchema.age;
  //     isUsuarioDB.displayname = usuarioSchema.displayname;
  //     isUsuarioDB.email = usuarioSchema.displayname;
  //     isUsuarioDB.phonernumber = usuarioSchema.phonernumber;
  //     isUsuarioDB.sex = usuarioSchema.sex;

  //     final res = respository.objectBox.createUsuario(isUsuarioDB);

  //     print(res);
  //   }
  // }