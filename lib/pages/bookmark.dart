import 'package:flutter/material.dart';

class UserBookmark extends StatelessWidget {
  const UserBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subscribe',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: "Blackhansans",
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(Icons.notifications),
                ),
                Icon(Icons.settings),
              ],
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Bookmark")),
    );
  }
}
