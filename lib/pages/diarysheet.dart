import 'package:flutter/material.dart';

class DiarySheet extends StatefulWidget {
  final DateTime selectedDate;
  const DiarySheet({super.key, required this.selectedDate});

  @override
  State<DiarySheet> createState() => _DiarySheetState();
}

class _DiarySheetState extends State<DiarySheet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("hi"),
    );
  }
}
