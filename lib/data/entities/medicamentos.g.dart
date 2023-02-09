// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamentos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicamentosEntity _$MedicamentosEntityFromJson(Map<String, dynamic> json) =>
    MedicamentosEntity(
      nombre: json['nombre'] as String,
      cantidad: json['cantidad'] as int,
      dosis: json['dosis'] as int,
      diasSemana: (json['dias_semana'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hora: (json['hora'] as List<dynamic>).map((e) => e as String).toList(),
    )..id = json['id'] as int;

Map<String, dynamic> _$MedicamentosEntityToJson(MedicamentosEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'cantidad': instance.cantidad,
      'dosis': instance.dosis,
      'dias_semana': instance.diasSemana,
      'hora': instance.hora,
    };
