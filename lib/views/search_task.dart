import 'package:flutter/material.dart';
import 'package:flutter_b4_v2/providers/user.dart';
import 'package:flutter_b4_v2/services/task.dart';
import 'package:provider/provider.dart';

import '../models/get_all_task.dart';

class SearchTaskView extends StatefulWidget {
  const SearchTaskView({super.key});

  @override
  State<SearchTaskView> createState() => _SearchTaskViewState();
}

class _SearchTaskViewState extends State<SearchTaskView> {
  TextEditingController searchController = TextEditingController();
  GetAllTaskModel? taskModel;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Task"),
      ),
      body: Column(
        children: [
          TextField(
            controller: searchController,
            onSubmitted: (val) {
              isLoading = true;
              setState(() {});
              TaskServices()
                  .searchTask(
                      token: userProvider.getToken().toString(),
                      search: searchController.text)
                  .then((val) {
                isLoading = false;
                taskModel = val;
                setState(() {});
              });
            },
          ),
          if(isLoading)
            CircularProgressIndicator(),
          if (taskModel != null)
            Expanded(
                child: ListView.builder(
                    itemCount: taskModel!.tasks!.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: Icon(Icons.task),
                        title:
                            Text(taskModel!.tasks![i].description.toString()),
                        subtitle:
                            Text(taskModel!.tasks![i].createdAt.toString()),
                      );
                    }))
        ],
      ),
    );
  }
}
