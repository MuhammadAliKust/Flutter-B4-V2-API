import 'package:flutter/material.dart';
import 'package:flutter_b4_v2/providers/user.dart';
import 'package:flutter_b4_v2/views/create_task.dart';
import 'package:flutter_b4_v2/views/get_all_task.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllTaskView()));
              },
              icon: Icon(Icons.task))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateTaskView()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text(
            userProvider.getUser()!.user!.name.toString(),
            style: TextStyle(fontSize: 30),
          ),
          Text(
            userProvider.getUser()!.user!.email.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
