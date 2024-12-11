import 'package:flutter/material.dart';
import 'package:flutter_b4_v2/providers/user.dart';
import 'package:flutter_b4_v2/services/task.dart';
import 'package:provider/provider.dart';

import '../models/get_all_task.dart';

class GetCompletedTaskView extends StatelessWidget {
  const GetCompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Completed Task"),
      ),
      body: FutureProvider.value(
          value: TaskServices()
              .getCompletedTask(userProvider.getToken().toString()),
          initialData: GetAllTaskModel(),
          builder: (context, child) {
            GetAllTaskModel taskModel = context.watch<GetAllTaskModel>();
            return taskModel.count == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: taskModel.tasks!.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: Icon(Icons.task),
                        title: Text(taskModel.tasks![i].description.toString()),
                        subtitle:
                            Text(taskModel.tasks![i].createdAt.toString()),
                      );
                    });
          }),
    );
  }
}
