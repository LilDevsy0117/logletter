import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logletter/firestore.dart';
import 'package:logletter/model/log.dart';

class LogController extends GetxController {
  var logs = <Log>[].obs;
  var currentUserEmail = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
    getCurrentUserEmail();
  }

  void getCurrentUserEmail() async {
    currentUserEmail.value = await FirestoreService().getUserEmail();
  }

  void fetchData() async {
    var logsStream = FirestoreService().getLogsSteram();
    // 스트림 구독
    logsStream.listen((QuerySnapshot querySnapshot) {
      // QuerySnapshot에서 DocumentSnapshot을 순회하여 데이터를 파싱하여 logs 리스트에 추가
      logs.value = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Log(
          docID: doc.id,
          log: data['log'] ?? '',
          name: data['name'] ?? '',
          email: data['email'] ?? '',
          time: data['timestamp'] ?? '',
          like: List<String>.from(data['like'] ?? []),
          subscribe: List<String>.from(data['subscribe'] ?? []),
          comment: List<String>.from(data['comment'] ?? []),
        );
      }).toList();
    });
  }

  void isPostLiked(Log post) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      post.isLiked.value = post.like.contains(currentUserEmail.value);
      post.isSubed.value = post.subscribe.contains(currentUserEmail.value);
    });
  }

  void toggleLike(Log post) async {
    if (post.like.contains(currentUserEmail.value)) {
      post.like.remove(currentUserEmail.value);
    } else {
      post.like.add(currentUserEmail.value);
    }

    await FirestoreService().updateLikeSub(post);
    isPostLiked(post);
  }

  void toggleSub(Log post) async {
    if (post.subscribe.contains(currentUserEmail.value)) {
      post.subscribe.remove(currentUserEmail.value);
    } else {
      post.subscribe.add(currentUserEmail.value);
    }

    await FirestoreService().updateLikeSub(post);
    isPostLiked(post);
  }
}
