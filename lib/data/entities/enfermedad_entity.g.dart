// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enfermedad_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnfermedadEntity _$EnfermedadEntityFromJson(Map<String, dynamic> json) =>
    EnfermedadEntity(
      nombre: json['nombre'] as String,
    )..id = json['id'] as int;

Map<String, dynamic> _$EnfermedadEntityToJson(EnfermedadEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
    };
