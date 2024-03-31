import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logletter/firestore.dart';

class DiarySheet extends StatefulWidget {
  final DateTime selectedDate;
  const DiarySheet({super.key, required this.selectedDate});

  @override
  State<DiarySheet> createState() => _DiarySheetState();
}

class _DiarySheetState extends State<DiarySheet> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();
  late DateTime date;
  late String? docID;
  late String name = '';

  @override
  void initState() {
    super.initState();
    date = widget.selectedDate;
    getName();
  }

  void getName() async {
    String tempname = await firestoreService.getUserName();
    setState(() {
      name = tempname;
    });
    getDocumentID();
  }

// 문서 ID를 가져오는 함수
  void getDocumentID() async {
    String id = await firestoreService.getLogDocumentID(
        DateFormat("yyyy년 MM월 dd일").format(date),
        firestoreService.user!.email!);
    setState(() {
      docID = id;
    });
  }

  // 삭제 확인 다이얼로그 표시 함수
  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 다이얼로그 외부를 탭하여 닫히지 않도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제 확인'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('정말로 삭제하시겠습니까?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                if (docID != null) {
                  firestoreService.deleteLog(docID!); // 삭제 실행
                  textController.clear();
                }
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.of(context).pop(); // 다이얼로그가 닫힌 후에는 이전 페이지로 이동
              },
              child: const Text('삭제'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                if (docID != null) {
                  _showDeleteConfirmationDialog(context);
                }
              },
              icon: Icon(Icons.delete,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("yyyy년 MM월 dd일").format(date),
              style: const TextStyle(
                fontFamily: "NotoSans",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const ButtonBar(),
                  StreamBuilder<QuerySnapshot>(
                    stream: firestoreService.getLogById(
                        DateFormat("yyyy년 MM월 dd일").format(date), name),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return TextField(
                          controller: textController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 28,
                          decoration: const InputDecoration(
                            hintText: "오늘 있었던 일을 알려주세요!",
                            enabledBorder: InputBorder.none,
                          ),
                        );
                      } else {
                        List logList = snapshot.data!.docs;
                        DocumentSnapshot document = logList.first;
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        String logText = data['log'];
                        return TextField(
                          controller: textController..text = logText,
                          keyboardType: TextInputType.multiline,
                          maxLines: 28,
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                        );
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      firestoreService.addLog(textController.text,
                          DateFormat("yyyy년 MM월 dd일").format(date), name);
                      textController.clear();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              offset: const Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary,
                              offset: const Offset(-3.0, -3.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: Center(
                          child: Text(
                        "기록하기",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "NotoSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
