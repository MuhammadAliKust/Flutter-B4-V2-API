import 'package:flutter/material.dart';
import 'package:flutter_b4_v2/providers/user.dart';
import 'package:flutter_b4_v2/services/task.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../models/get_all_task.dart';

class GetAllTaskView extends StatefulWidget {
  const GetAllTaskView({super.key});

  @override
  State<GetAllTaskView> createState() => _GetAllTaskViewState();
}

class _GetAllTaskViewState extends State<GetAllTaskView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Get All Task"),
      ),
      body: LoadingOverlay(
        isLoading: isLoading,
        child: FutureProvider.value(
            value: TaskServices().getAllTask(userProvider.getToken().toString()),
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
                          trailing: IconButton(
                              onPressed: () {
                                isLoading = true;
                                setState(() {});
                                TaskServices()
                                    .deleteTask(
                                        token: userProvider.getToken().toString(),
                                        taskID: taskModel.tasks![i].id.toString())
                                    .then((val) {
                                  isLoading = false;
                                  setState(() {});
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        );
                      });
            }),
      ),
    );
  }
}
