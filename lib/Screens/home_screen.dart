import 'dart:developer';

import 'package:chatapp/api/apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: const Text("ChatUp"),
        leading: const Icon(Icons.person),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),

      // Button for adding new People
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            await _signOut();
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),

      body: StreamBuilder(
        stream: APIs.firestore.collection('users').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          final list = <String>[]; // Specify the type of elements in the list

          if (snapshot.hasData) {
            final data = snapshot.data?.docs;

            for (var i in data!) {
              log('Data:${i.data()}');
              list.add(i.data()['name']); // Access 'name' property safely
            }
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Text('Name:${list[index]}');
            },
          );
        },
      ),
    );
  }

  Future<void> _signOut() async {
    await APIs.auth.signOut();
    await GoogleSignIn().signOut();
  }
}
