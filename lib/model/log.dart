import 'package:get/get.dart';

class Log {
  final String docID;
  final String log;
  final String name;
  final String email;
  final String time;
  final List<String> like;
  final List<String> subscribe;
  final List<String> comment;
  var isLiked = false.obs;
  var isSubed = false.obs;
  Log({
    required this.docID,
    required this.log,
    required this.name,
    required this.email,
    required this.time,
    required this.like,
    required this.subscribe,
    required this.comment,
  });
}
