// To parse this JSON data, do
//
//     final createTaskModel = createTaskModelFromJson(jsonString);

import 'dart:convert';

CreateTaskModel createTaskModelFromJson(String str) => CreateTaskModel.fromJson(json.decode(str));

String createTaskModelToJson(CreateTaskModel data) => json.encode(data.toJson());

class CreateTaskModel {
  final CreateTask? task;
  final String? message;
  final bool? status;

  CreateTaskModel({
    this.task,
    this.message,
    this.status,
  });

  factory CreateTaskModel.fromJson(Map<String, dynamic> json) => CreateTaskModel(
    task: json["task"] == null ? null : CreateTask.fromJson(json["task"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "task": task?.toJson(),
    "message": message,
    "status": status,
  };
}

class CreateTask {
  final String? description;
  final bool? complete;
  final String? owner;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  CreateTask({
    this.description,
    this.complete,
    this.owner,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CreateTask.fromJson(Map<String, dynamic> json) => CreateTask(
    description: json["description"],
    complete: json["complete"],
    owner: json["owner"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "complete": complete,
    "owner": owner,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
