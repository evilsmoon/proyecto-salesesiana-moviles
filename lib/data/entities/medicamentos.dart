import 'package:chronosmedic_app/data/entities/enfermedad_entity.dart';
import 'package:chronosmedic_app/data/entities/entities.dart';
import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medicamentos.g.dart';

@JsonSerializable(includeIfNull: false)
@Entity()
class MedicamentosEntity {
  @Id()
  int id = 0;
  @JsonKey(name: 'nombre')
  String nombre;
  @JsonKey(name: 'cantidad')
  int cantidad;
  @JsonKey(name: 'dosis')
  int dosis;
  @JsonKey(name: 'dias_semana')
  List<String> diasSemana;
  @JsonKey(name: 'hora')
  List<String> hora;

/* 
@Relations
 */
  final enfermedadEnf = ToOne<EnfermedadEntity>();

  MedicamentosEntity({
    required this.nombre,
    required this.cantidad,
    required this.dosis,
    required this.diasSemana,
    required this.hora,
  });

  factory MedicamentosEntity.fromJson(Map<String, dynamic> json) =>
      _$MedicamentosEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MedicamentosEntityToJson(this);
}
