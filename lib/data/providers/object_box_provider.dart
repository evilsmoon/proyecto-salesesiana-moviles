import 'package:chronosmedic_app/data/entities/enfermedad_entity.dart';
import 'package:chronosmedic_app/data/entities/medicamentos.dart';
import 'package:chronosmedic_app/data/entities/usuario_entity.dart';
import 'package:chronosmedic_app/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class ObjectBoxProvider {
  late final Store _store;
  late final Box<UsuarioEntity> _usuarioBox;
  late final Box<EnfermedadEntity> _enfermedadBox;
  late final Box<MedicamentosEntity> _medicamentoBox;

  ObjectBoxProvider._init(this._store) {
    _usuarioBox = Box<UsuarioEntity>(_store);
    _enfermedadBox = Box<EnfermedadEntity>(_store);
    _medicamentoBox = Box<MedicamentosEntity>(_store);
  }

  static Future<ObjectBoxProvider> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-chonosmedic"));
    return ObjectBoxProvider._init(store);
  }

  int createUsuario(UsuarioEntity usuario) {
    return _usuarioBox.put(usuario);
  }

  int createEnfermedad(
    UsuarioEntity usuario,
    EnfermedadEntity enfermedad,
  ) {
    enfermedad.usuarioEnf.target = usuario;
    return _enfermedadBox.put(enfermedad);
  }

  int createMedicamento(
    EnfermedadEntity enfermedad,
    MedicamentosEntity medicamento,
  ) {
    medicamento.enfermedadEnf.target = enfermedad;
    return _medicamentoBox.put(medicamento);
  }

  // int createEnfermedad()
  UsuarioEntity? getUsuario(id) => _usuarioBox.get(id);
  EnfermedadEntity? getEnfermedad(id) => _enfermedadBox.get(id);
  MedicamentosEntity? getMedicamento(id) => _medicamentoBox.get(id);

  UsuarioEntity? findUsuarioUUID(String uuid) =>
      _usuarioBox.query(UsuarioEntity_.uuid.equals(uuid)).build().findFirst();
}
