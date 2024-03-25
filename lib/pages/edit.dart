import 'package:flutter/material.dart';
import 'package:logletter/pages/diarysheet.dart';
import 'package:table_calendar/table_calendar.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DiarySheet(selectedDate: selectedDate),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Logging',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: "Blackhansans",
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.notifications,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar(
            onDaySelected: onDaySelected,
            selectedDayPredicate: (date) {
              return isSameDay(selectedDate, date);
            },
            focusedDay: selectedDate,
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DiarySheet(selectedDate: selectedDate)),
          );
        },
        backgroundColor: const Color(0xff5F6BBA),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
