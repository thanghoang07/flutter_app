import 'package:json_annotation/json_annotation.dart';
import 'package:thanghoang/business/utils/uuid.dart';

@JsonSerializable()
class Task {
  String id;
  String name;
  int color;
  @JsonKey(name: 'code_point')
  int codePoint;

  Task(
      this.name, {
        required this.color,
        required this.codePoint,
        String? id,
      }) : id = id ?? Uuid().generateV4();

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$TaskFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TaskFromJson`.
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(json['name'] as String,
      color: json['color'] as int,
      codePoint: json['code_point'] as int,
      id: json['id'] as String);
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'color': instance.color,
  'code_point': instance.codePoint
};