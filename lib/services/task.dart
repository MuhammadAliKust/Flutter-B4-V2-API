import 'dart:convert';
import 'dart:developer';

import 'package:flutter_b4_v2/models/create_task.dart';
import 'package:flutter_b4_v2/models/get_all_task.dart';
import 'package:http/http.dart' as http;

class TaskServices {
  String baseUrl = "https://todo-nu-plum-19.vercel.app/";

  ///Create Task
  Future<CreateTaskModel> createTask(
      {required String description, required String token}) async {
    http.Response response = await http.post(Uri.parse("${baseUrl}todos/add"),
        headers: {'Content-Type': 'application/json', 'Authorization': token},
        body: jsonEncode({"description": description}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return CreateTaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Update Task
  Future updateTask(
      {required String description,
      required String token,
      required String taskID}) async {
    http.Response response = await http.patch(
        Uri.parse("${baseUrl}todos/update/$taskID"),
        headers: {'Content-Type': 'application/json', 'Authorization': token},
        body: jsonEncode({"description": description, "complete": true}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Get All Task
  Future<GetAllTaskModel> getAllTask(String token) async {
    http.Response response = await http.get(
      Uri.parse('${baseUrl}todos/get'),
      headers: {'Authorization': token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GetAllTaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Get Completed Task
  Future<GetAllTaskModel> getCompletedTask(String token) async {
    http.Response response = await http.get(
      Uri.parse('${baseUrl}todos/completed'),
      headers: {'Authorization': token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GetAllTaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Get InCompleted Task
  Future<GetAllTaskModel> getInCompletedTask(String token) async {
    http.Response response = await http.get(
      Uri.parse('${baseUrl}todos/incomplete'),
      headers: {'Authorization': token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GetAllTaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Search Task
  Future<GetAllTaskModel> searchTask(
      {required String token, required String search}) async {
    http.Response response = await http.get(
      Uri.parse('${baseUrl}todos/search?keywords=$search'),
      headers: {'Authorization': token},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return GetAllTaskModel.fromJson(jsonDecode(response.body));
    } else {
      throw response.reasonPhrase.toString();
    }
  }

  ///Delete Task
  Future<bool> deleteTask(
      {required String token, required String taskID}) async {
    http.Response response = await http.delete(
      Uri.parse('${baseUrl}todos/delete/$taskID'),
      headers: {'Authorization': token},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw response.reasonPhrase.toString();
    }
  }
}
