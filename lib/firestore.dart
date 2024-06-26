import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logletter/model/log.dart';

class FirestoreService {
  User? user = FirebaseAuth.instance.currentUser;

  final CollectionReference logs =
      FirebaseFirestore.instance.collection('logs');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

// 사용자의 이름 가져오기
  Future<String> getUserName() async {
    try {
      if (user != null) {
        DocumentSnapshot userDoc = await users.doc(user!.email).get();
        if (userDoc.exists) {
          return (userDoc.data() as Map)['name'];
        }
      }
    } catch (e) {
      print("Error getting user name: $e");
    }
    return "unknown";
  }

  Future<String> getUserEmail() async {
    try {
      if (user != null) {
        DocumentSnapshot userDoc = await users.doc(user!.email).get();
        if (userDoc.exists) {
          return (userDoc.data() as Map)['email'];
        }
      }
    } catch (e) {
      print("Error getting user email: $e");
    }
    return "unknown";
  }

  // CREATE : add a new log
  Future<void> addLog(String log, String date, String name) async {
    DocumentSnapshot useremail = await users.doc(user!.email).get();
    logs.add({
      'name': name,
      'log': log,
      'timestamp': date,
      'email': (useremail.data() as Map)['email'],
      'like': <String>[],
      'subscribe': <String>[],
      'comment': <String>[],
    });
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getLogsStream() {
    final logsStream = logs.orderBy('timestamp', descending: true).snapshots();
    return logsStream;
  }

  Stream<QuerySnapshot> getLogById(String date, String name) {
    final logStream = logs
        .where('timestamp', isEqualTo: date)
        .where('name', isEqualTo: name)
        .snapshots();
    return logStream;
  }

  Future<String> getLogDocumentID(String date, String mail) async {
    String docID = '';
    try {
      QuerySnapshot querySnapshot = await logs
          .where('email', isEqualTo: mail)
          .where('timestamp', isEqualTo: date)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        docID = querySnapshot.docs.first.id;
      }
    } catch (e) {
      print("Error getting document ID: $e");
    }

    return docID;
  }

  // UPDATE : update notes given a doc id
  Future<void> updateLike(Log log) async {
    String docID = await getLogDocumentID(log.time, log.email);
    try {
      await logs.doc(docID).update({
        'like': log.like,
      });
    } catch (e) {
      print("Error updating log: $e");
    }
  }

  Future<void> updateSub(Log log) async {
    String docID = await getLogDocumentID(log.time, log.email);
    try {
      await logs.doc(docID).update({
        'subscribe': log.subscribe,
      });
    } catch (e) {
      print("Error updating log: $e");
    }
  }

  // DELETE: delete logs given a doc id
  Future<void> deleteLog(String docID) {
    return logs.doc(docID).delete();
  }
}
