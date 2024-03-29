import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logletter/components/user_post.dart';
import 'package:logletter/controller/log_controller.dart';
import 'package:logletter/firestore.dart';
import 'package:get/get.dart';

class UserHome extends StatelessWidget {
  UserHome({
    super.key,
  });

  final FirestoreService firestoreService = FirestoreService();
  final logController = Get.put(LogController());

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
      body: Obx(() {
        if (logController.logs.isEmpty) {
          return const Center(child: Text("일기가 없습니다..."));
        } else {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: logController.logs.length,
            itemBuilder: (context, index) {
              var log = logController.logs[index];
              return UserPosts(
                name: log.name,
                log: log.log,
                email: log.email,
                time: log.time,
                like: log.like,
                subscribe: log.subscribe,
                comment: log.comment,
              );
            },
          );
        }
      }),
    );
  }
}
