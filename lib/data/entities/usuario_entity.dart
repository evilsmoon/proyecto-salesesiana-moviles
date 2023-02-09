import 'package:chronosmedic_app/data/entities/enfermedad_entity.dart';
import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_entity.g.dart';

@JsonSerializable(includeIfNull: false)
@Entity()
class UsuarioEntity {
  @Id()
  int id = 0;
  @JsonKey(name: 'display_name')
  String? displayname;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'age')
  int? age;
  @JsonKey(name: 'phoner_number')
  String? phonernumber;
  @JsonKey(name: 'photo_url')
  String? photourl;
  @JsonKey(name: 'sex')
  String? sex;
  @JsonKey(name: 'created_time')
  String? createdtime;
  @JsonKey(name: 'uuid')
  String uuid;

  @Backlink()
  final enfermedadesUsu = ToMany<EnfermedadEntity>();

  UsuarioEntity({
    this.displayname,
    this.email,
    this.age,
    this.phonernumber,
    this.photourl,
    this.sex,
    this.createdtime,
    required this.uuid,
  });

  factory UsuarioEntity.fromJson(Map<String, dynamic> json) =>
      _$UsuarioEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioEntityToJson(this);
}
