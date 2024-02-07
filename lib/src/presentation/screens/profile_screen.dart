import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/src/data/firebase/firebase_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _chatController = TextEditingController();
  List<Map<String, dynamic>> chatData = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:
                    FirebaseFirestore.instance.collection('chats').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    chatData =
                        snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  }
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      String email = chatData[index]['email'];
                      return Column(
                        crossAxisAlignment:
                            email == FirebaseAuth.instance.currentUser?.email
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          Text('${chatData[index]['email']}'),
                          Container(
                            child: Text('${chatData[index]['message']}'),
                            color: Colors.black12,
                            padding: EdgeInsets.all(6),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 4,
                      );
                    },
                    itemCount: chatData.length,
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: Colors.white,
            child: TextField(
              controller: _chatController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send_outlined),
                  onPressed: () {
                    FirebaseService().writeChat(_chatController.text);

                    setState(() {
                      _chatController.text = '';
                    });

                    /// Close keyboard
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
