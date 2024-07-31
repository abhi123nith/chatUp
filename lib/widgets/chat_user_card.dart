import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.blue.shade100,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04, vertical: 2.5),
      child: InkWell(
          onTap: () {},
          child: const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Abhishek Godara'),
            subtitle: Text('Hii how are you ? '),
            trailing: Text('4:00 PM'),
          )),
    );
  }
}
