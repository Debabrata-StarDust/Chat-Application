// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/main.dart';

class ChatUserCard extends StatelessWidget {
   ChatUserCard({super.key, required this.username, });
  final String username ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: mq.width * .004, vertical: mq.height * .005),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue.shade50,
      child: InkWell(
        onTap: () {},
        // ignore: prefer_const_constructors
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title:  Text(username),
          subtitle: const Text(
            "User Message ",
            maxLines: 2,
          ),
          trailing: const Text(
            "12.00 PM",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
