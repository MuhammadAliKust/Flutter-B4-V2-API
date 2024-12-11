import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_b4_v2/models/get_all_task.dart';
import 'package:flutter_b4_v2/providers/user.dart';
import 'package:flutter_b4_v2/services/task.dart';
import 'package:provider/provider.dart';

class UpdateTaskView extends StatefulWidget {
  final Task model;

  UpdateTaskView({super.key, required this.model});

  @override
  State<UpdateTaskView> createState() => _UpdateTaskViewState();
}

class _UpdateTaskViewState extends State<UpdateTaskView> {
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    descriptionController =
        TextEditingController(text: widget.model.description.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
      ),
      body: Column(
        children: [
          TextField(
            controller: descriptionController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async{
                log('update');
               await TaskServices()
                    .updateTask(
                        description: descriptionController.text,
                        token: userProvider.getToken().toString(),
                        taskID: widget.model.id.toString())
                    .then((val) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Message"),
                          content: Text("Task has been updated successfully"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("Okay"))
                          ],
                        );
                      });
                });
              },
              child: Text("Update Task"))
        ],
      ),
    );
  }
}
