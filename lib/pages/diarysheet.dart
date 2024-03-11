import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiarySheet extends StatefulWidget {
  final DateTime selectedDate;
  const DiarySheet({super.key, required this.selectedDate});

  @override
  State<DiarySheet> createState() => _DiarySheetState();
}

class _DiarySheetState extends State<DiarySheet> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                  TextField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.multiline,
                    maxLines: 28,
                    decoration: const InputDecoration(
                      hintText: "오늘 있었던 일을 알려주세요!",
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     backgroundColor: const Color(0xff5F6BBA),
                  //     foregroundColor: Colors.white,
                  //     textStyle: const TextStyle(
                  //       fontFamily: "NotoSans",
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     print('submit');
                  //   },
                  //   child: const Text('기록하기'),
                  // ),
                  GestureDetector(
                    onTap: () {
                      print('submit');
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
                              color: Colors.grey.shade600,
                              offset: const Offset(5.0, 5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5.0, -5.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            )
                          ]),
                      child: const Center(
                          child: Text(
                        "기록하기",
                        style: TextStyle(
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
