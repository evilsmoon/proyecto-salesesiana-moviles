import 'package:json_annotation/json_annotation.dart';
part 'usuario.g.dart';

@JsonSerializable(includeIfNull: false)
class UsuarioSchema {
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

  UsuarioSchema({
    this.displayname,
    this.email,
    this.age,
    this.phonernumber,
    this.photourl,
    this.sex,
    this.createdtime,
    required this.uuid,
  });

  factory UsuarioSchema.fromJson(Map<String, dynamic> json) =>
      _$UsuarioSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioSchemaToJson(this);
}
