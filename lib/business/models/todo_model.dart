import 'package:json_annotation/json_annotation.dart';
import 'package:thanghoang/business/utils/uuid.dart';

@JsonSerializable()
class Todo {
  final String id, parent;
  final String name;
  @JsonKey(name: 'completed')
  final int isCompleted;

  Todo(this.name, {required this.parent, this.isCompleted = 0, String? id})
      : this.id = id ?? Uuid().generateV4();

  Todo copy({String? name, int? isCompleted, String? id, String? parent}) {
    return Todo(
      name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
      parent: parent ?? this.parent,
    );
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$TodoFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TodoFromJson`.
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(json['name'] as String,
      parent: json['parent'] as String,
      isCompleted: json['completed'] as int,
      id: json['id'] as String);
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
  'id': instance.id,
  'parent': instance.parent,
  'name': instance.name,
  'completed': instance.isCompleted
};