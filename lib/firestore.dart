import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference logs =
      FirebaseFirestore.instance.collection('logs');

  // CREATE : add a new log
  Future<void> addLog(String log, String date) {
    return logs.add({
      'log': log,
      'timestamp': date,
    });
  }

  // READ: get notes from database
  Stream<QuerySnapshot> getLogsSteram() {
    final logsStream = logs.orderBy('timestamp', descending: true).snapshots();
    return logsStream;
  }

  Stream<QuerySnapshot> getLogById(String date) {
    final logStream = logs.where('timestamp', isEqualTo: date).snapshots();
    return logStream;
  }

  Future<String> getLogDocumentID(String date) async {
    String docID = '';
    try {
      QuerySnapshot querySnapshot =
          await logs.where('timestamp', isEqualTo: date).get();
      if (querySnapshot.docs.isNotEmpty) {
        docID = querySnapshot.docs.first.id;
      }
    } catch (e) {
      print("Error getting document ID: $e");
    }
    return docID;
  }

  // UPDATE : update notes given a doc id
  Future<void> updateLog(String docID, String newLog) {
    return logs.doc(docID).update({
      'log': newLog,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete logs given a doc id
  Future<void> deleteLog(String docID) {
    return logs.doc(docID).delete();
  }
}