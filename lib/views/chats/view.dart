import 'package:chat_app_using_firebase/core/route_utils/route_utils.dart';
import 'package:chat_app_using_firebase/views/splash/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              RouteUtils.pushAndPopAll(SplashView());
            },
            icon: Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("j"),
            ),
            title: Text("jemi@gmail.com"),
            subtitle: Text('ajccsac'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.black),
      ),
    );
  }
}
