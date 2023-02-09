// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioSchema _$UsuarioSchemaFromJson(Map<String, dynamic> json) =>
    UsuarioSchema(
      displayname: json['display_name'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
      phonernumber: json['phoner_number'] as String?,
      photourl: json['photo_url'] as String?,
      sex: json['sex'] as String?,
      createdtime: json['created_time'] as String?,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$UsuarioSchemaToJson(UsuarioSchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('display_name', instance.displayname);
  writeNotNull('email', instance.email);
  writeNotNull('age', instance.age);
  writeNotNull('phoner_number', instance.phonernumber);
  writeNotNull('photo_url', instance.photourl);
  writeNotNull('sex', instance.sex);
  writeNotNull('created_time', instance.createdtime);
  val['uuid'] = instance.uuid;
  return val;
}
