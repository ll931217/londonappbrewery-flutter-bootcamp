import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flash_chat/components/message_bubble.dart';

class MessagesStream extends StatelessWidget {
  MessagesStream({super.key});

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.docs.reversed;
          List<MessageBubble> messageBubbles = [];

          for (var message in messages) {
            final messageSender = message.data()['sender'];
            final messageText = message.data()['text'];

            final messageBubble = MessageBubble(
                sender: messageSender,
                text: messageText,
                isMe: user?.email == messageSender,
            );

            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              reverse: true,
              children: messageBubbles,
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
            child: const CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
      }
    );
  }
}
