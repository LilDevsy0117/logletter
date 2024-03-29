import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logletter/firestore.dart';
import 'package:logletter/model/log.dart';

class LogController extends GetxController {
  var logs = <Log>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    var logsStream = FirestoreService().getLogsSteram();
    // 스트림 구독
    logsStream.listen((QuerySnapshot querySnapshot) {
      // QuerySnapshot에서 DocumentSnapshot을 순회하여 데이터를 파싱하여 logs 리스트에 추가
      logs.value = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return Log(
          log: data['log'] ?? '',
          name: data['name'] ?? '',
          email: data['email'] ?? '',
          time: data['time'] ?? '',
          like: List<String>.from(data['like'] ?? []),
          subscribe: List<String>.from(data['subscribe'] ?? []),
          comment: List<String>.from(data['comment'] ?? []),
        );
      }).toList();
    });
  }
}
