import 'package:chronosmedic_app/data/entities/entities.dart';
import 'package:chronosmedic_app/data/entities/medicamentos.dart';
import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enfermedad_entity.g.dart';

@JsonSerializable(includeIfNull: false)
@Entity()
class EnfermedadEntity {
  @Id()
  int id = 0;
  @JsonKey(name: 'nombre')
  String nombre;

/* 
@Relations
 */

  @Backlink()
  final medicacmendosUsu = ToMany<MedicamentosEntity>();

  final usuarioEnf = ToOne<UsuarioEntity>();

  EnfermedadEntity({required this.nombre});

  factory EnfermedadEntity.fromJson(Map<String, dynamic> json) =>
      _$EnfermedadEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EnfermedadEntityToJson(this);
}
