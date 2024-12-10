import 'dart:convert';

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
}
