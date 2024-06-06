import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  String? id; 

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'email')
  String? email;


  User({
    this.id,
    this.name,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json); 

  Map<String, dynamic> toJson() => _$UserToJson(this); 

}