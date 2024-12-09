import 'package:flutter/material.dart';
import 'package:flutter_b4_v2/providers/user.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
