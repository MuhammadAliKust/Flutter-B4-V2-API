// To parse this JSON data, do
//
//     final getAllTaskModel = getAllTaskModelFromJson(jsonString);

import 'dart:convert';

GetAllTaskModel getAllTaskModelFromJson(String str) => GetAllTaskModel.fromJson(json.decode(str));

String getAllTaskModelToJson(GetAllTaskModel data) => json.encode(data.toJson());

class GetAllTaskModel {
  final List<Task>? tasks;
  final int? totalPages;
  final int? currentPage;
  final int? count;

  GetAllTaskModel({
    this.tasks,
    this.totalPages,
    this.currentPage,
    this.count,
  });

  factory GetAllTaskModel.fromJson(Map<String, dynamic> json) => GetAllTaskModel(
    tasks: json["tasks"] == null ? [] : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x.toJson())),
    "totalPages": totalPages,
    "currentPage": currentPage,
    "count": count,
  };
}

class Task {
  final String? id;
  final String? description;
  final bool? complete;
  final String? owner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Task({
    this.id,
    this.description,
    this.complete,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["_id"],
    description: json["description"],
    complete: json["complete"],
    owner: json["owner"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "complete": complete,
    "owner": owner,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
