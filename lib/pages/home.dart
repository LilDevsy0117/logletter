import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logletter/components/user_post.dart';
import 'package:logletter/firestore.dart';

class UserHome extends StatefulWidget {
  const UserHome({
    super.key,
  });

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'logletter',
                style: TextStyle(
                  fontFamily: "Blackhansans",
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.notifications),
                  ),
                  Icon(Icons.settings),
                ],
              ),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getLogsSteram(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List logsList = snapshot.data!.docs;
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: logsList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = logsList[index];

                  Map<String, dynamic>? data =
                      document.data() as Map<String, dynamic>;
                  String logText = data['log'];

                  return UserPosts(
                    name: data['name'],
                    log: logText,
                  );
                },
              );
            } else {
              return const Text("일기가 없습니다 ...");
            }
          },
        ));
  }
}
