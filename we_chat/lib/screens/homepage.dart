import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_chat/api/api.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/widgets/chatuser_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(CupertinoIcons.home),
        title: const Text("We Chat"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () async {
                await Apis.firebaseAuth.signOut();
                await GoogleSignIn().signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 22, right: 12),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.chat),
        ),
      ),
      body: StreamBuilder(
          // users is the collections of firebase which i am creating
          stream: Apis.firebaseStore.collection('users').snapshots(),
          builder: (context, snapshot) {
            final List = [];
            if (snapshot.hasData) {
              // docs is hear in firebase document
              final data = snapshot.data?.docs;
              //data is here for user details in firebase
              for (var i in data!) {
                print(i.data());
                List.add(i.data()['name']);
                List.add(i.data()['about']);
              }
              {}
            }
            return ListView.builder(
                padding: EdgeInsets.only(top: mq.height * 0.006),
                itemCount: List.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatUserCard(
                    username: '${List[index]}',
                  );
                  // return Text("Name:${List[index]}");
                });
          }),
    );
  }
}
