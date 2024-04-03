import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}

String formatDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  String year = dateTime.year.toString();

  String month = dateTime.month.toString();

  String day = dateTime.day.toString();

  String hour = dateTime.hour.toString();

  String min = dateTime.minute.toString();

  String formattedDate = '$month/$day $hour:$min';

  return formattedDate;
}
