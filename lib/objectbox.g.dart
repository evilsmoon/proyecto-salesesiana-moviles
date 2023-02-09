// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/entities/enfermedad_entity.dart';
import 'data/entities/medicamentos.dart';
import 'data/entities/usuario_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4484461767964428852),
      name: 'UsuarioEntity',
      lastPropertyId: const IdUid(9, 143324858580862082),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6760846967862999854),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2273831218288493910),
            name: 'displayname',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2403059981196179684),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1523177995019256940),
            name: 'age',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4977964959656072250),
            name: 'phonernumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5794730967115467398),
            name: 'photourl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4055990345448853871),
            name: 'sex',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2204971479375200971),
            name: 'createdtime',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 143324858580862082),
            name: 'uuid',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'enfermedadesUsu',
            srcEntity: 'EnfermedadEntity',
            srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(2, 7462188824054725120),
      name: 'EnfermedadEntity',
      lastPropertyId: const IdUid(3, 2237377387434605463),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6168001472476535412),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1937681781881578315),
            name: 'nombre',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2237377387434605463),
            name: 'usuarioEnfId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 6844006954087778289),
            relationTarget: 'UsuarioEntity')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'medicacmendosUsu',
            srcEntity: 'MedicamentosEntity',
            srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(3, 809567209015798376),
      name: 'MedicamentosEntity',
      lastPropertyId: const IdUid(8, 5636303409999568361),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4199317018162568451),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3742963238714794670),
            name: 'nombre',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1989761111212446536),
            name: 'cantidad',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8380747119497833173),
            name: 'dosis',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2200182922886430633),
            name: 'diasSemana',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8639461344879859716),
            name: 'hora',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5636303409999568361),
            name: 'enfermedadEnfId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 6435384468624342669),
            relationTarget: 'EnfermedadEntity')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 809567209015798376),
      lastIndexId: const IdUid(2, 6435384468624342669),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [6785213226251786310],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    UsuarioEntity: EntityDefinition<UsuarioEntity>(
        model: _entities[0],
        toOneRelations: (UsuarioEntity object) => [],
        toManyRelations: (UsuarioEntity object) => {
              RelInfo<EnfermedadEntity>.toOneBacklink(3, object.id,
                      (EnfermedadEntity srcObject) => srcObject.usuarioEnf):
                  object.enfermedadesUsu
            },
        getId: (UsuarioEntity object) => object.id,
        setId: (UsuarioEntity object, int id) {
          object.id = id;
        },
        objectToFB: (UsuarioEntity object, fb.Builder fbb) {
          final displaynameOffset = object.displayname == null
              ? null
              : fbb.writeString(object.displayname!);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final phonernumberOffset = object.phonernumber == null
              ? null
              : fbb.writeString(object.phonernumber!);
          final photourlOffset = object.photourl == null
              ? null
              : fbb.writeString(object.photourl!);
          final sexOffset =
              object.sex == null ? null : fbb.writeString(object.sex!);
          final createdtimeOffset = object.createdtime == null
              ? null
              : fbb.writeString(object.createdtime!);
          final uuidOffset = fbb.writeString(object.uuid);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, displaynameOffset);
          fbb.addOffset(2, emailOffset);
          fbb.addInt64(3, object.age);
          fbb.addOffset(4, phonernumberOffset);
          fbb.addOffset(5, photourlOffset);
          fbb.addOffset(6, sexOffset);
          fbb.addOffset(7, createdtimeOffset);
          fbb.addOffset(8, uuidOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = UsuarioEntity(
              displayname: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              age: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              phonernumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              photourl: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              sex: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              createdtime: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              uuid: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 20, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.enfermedadesUsu,
              store,
              RelInfo<EnfermedadEntity>.toOneBacklink(3, object.id,
                  (EnfermedadEntity srcObject) => srcObject.usuarioEnf),
              store.box<UsuarioEntity>());
          return object;
        }),
    EnfermedadEntity: EntityDefinition<EnfermedadEntity>(
        model: _entities[1],
        toOneRelations: (EnfermedadEntity object) => [object.usuarioEnf],
        toManyRelations: (EnfermedadEntity object) => {
              RelInfo<MedicamentosEntity>.toOneBacklink(
                  8,
                  object.id,
                  (MedicamentosEntity srcObject) =>
                      srcObject.enfermedadEnf): object.medicacmendosUsu
            },
        getId: (EnfermedadEntity object) => object.id,
        setId: (EnfermedadEntity object, int id) {
          object.id = id;
        },
        objectToFB: (EnfermedadEntity object, fb.Builder fbb) {
          final nombreOffset = fbb.writeString(object.nombre);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nombreOffset);
          fbb.addInt64(2, object.usuarioEnf.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = EnfermedadEntity(
              nombre: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.usuarioEnf.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.usuarioEnf.attach(store);
          InternalToManyAccess.setRelInfo(
              object.medicacmendosUsu,
              store,
              RelInfo<MedicamentosEntity>.toOneBacklink(8, object.id,
                  (MedicamentosEntity srcObject) => srcObject.enfermedadEnf),
              store.box<EnfermedadEntity>());
          return object;
        }),
    MedicamentosEntity: EntityDefinition<MedicamentosEntity>(
        model: _entities[2],
        toOneRelations: (MedicamentosEntity object) => [object.enfermedadEnf],
        toManyRelations: (MedicamentosEntity object) => {},
        getId: (MedicamentosEntity object) => object.id,
        setId: (MedicamentosEntity object, int id) {
          object.id = id;
        },
        objectToFB: (MedicamentosEntity object, fb.Builder fbb) {
          final nombreOffset = fbb.writeString(object.nombre);
          final diasSemanaOffset = fbb.writeList(
              object.diasSemana.map(fbb.writeString).toList(growable: false));
          final horaOffset = fbb.writeList(
              object.hora.map(fbb.writeString).toList(growable: false));
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nombreOffset);
          fbb.addInt64(2, object.cantidad);
          fbb.addInt64(3, object.dosis);
          fbb.addOffset(5, diasSemanaOffset);
          fbb.addOffset(6, horaOffset);
          fbb.addInt64(7, object.enfermedadEnf.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MedicamentosEntity(
              nombre: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              cantidad:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              dosis:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              diasSemana: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGet(buffer, rootOffset, 14, []),
              hora: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGet(buffer, rootOffset, 16, []))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.enfermedadEnf.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          object.enfermedadEnf.attach(store);
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [UsuarioEntity] entity fields to define ObjectBox queries.
class UsuarioEntity_ {
  /// see [UsuarioEntity.id]
  static final id =
      QueryIntegerProperty<UsuarioEntity>(_entities[0].properties[0]);

  /// see [UsuarioEntity.displayname]
  static final displayname =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[1]);

  /// see [UsuarioEntity.email]
  static final email =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[2]);

  /// see [UsuarioEntity.age]
  static final age =
      QueryIntegerProperty<UsuarioEntity>(_entities[0].properties[3]);

  /// see [UsuarioEntity.phonernumber]
  static final phonernumber =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[4]);

  /// see [UsuarioEntity.photourl]
  static final photourl =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[5]);

  /// see [UsuarioEntity.sex]
  static final sex =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[6]);

  /// see [UsuarioEntity.createdtime]
  static final createdtime =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[7]);

  /// see [UsuarioEntity.uuid]
  static final uuid =
      QueryStringProperty<UsuarioEntity>(_entities[0].properties[8]);
}

/// [EnfermedadEntity] entity fields to define ObjectBox queries.
class EnfermedadEntity_ {
  /// see [EnfermedadEntity.id]
  static final id =
      QueryIntegerProperty<EnfermedadEntity>(_entities[1].properties[0]);

  /// see [EnfermedadEntity.nombre]
  static final nombre =
      QueryStringProperty<EnfermedadEntity>(_entities[1].properties[1]);

  /// see [EnfermedadEntity.usuarioEnf]
  static final usuarioEnf = QueryRelationToOne<EnfermedadEntity, UsuarioEntity>(
      _entities[1].properties[2]);
}

/// [MedicamentosEntity] entity fields to define ObjectBox queries.
class MedicamentosEntity_ {
  /// see [MedicamentosEntity.id]
  static final id =
      QueryIntegerProperty<MedicamentosEntity>(_entities[2].properties[0]);

  /// see [MedicamentosEntity.nombre]
  static final nombre =
      QueryStringProperty<MedicamentosEntity>(_entities[2].properties[1]);

  /// see [MedicamentosEntity.cantidad]
  static final cantidad =
      QueryIntegerProperty<MedicamentosEntity>(_entities[2].properties[2]);

  /// see [MedicamentosEntity.dosis]
  static final dosis =
      QueryIntegerProperty<MedicamentosEntity>(_entities[2].properties[3]);

  /// see [MedicamentosEntity.diasSemana]
  static final diasSemana =
      QueryStringVectorProperty<MedicamentosEntity>(_entities[2].properties[4]);

  /// see [MedicamentosEntity.hora]
  static final hora =
      QueryStringVectorProperty<MedicamentosEntity>(_entities[2].properties[5]);

  /// see [MedicamentosEntity.enfermedadEnf]
  static final enfermedadEnf =
      QueryRelationToOne<MedicamentosEntity, EnfermedadEntity>(
          _entities[2].properties[6]);
}
