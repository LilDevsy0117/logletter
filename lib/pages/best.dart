import 'package:flutter/material.dart';

class UserBest extends StatelessWidget {
  const UserBest({super.key});

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
              'Best log',
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
      body: const Center(child: Text("Best")),
    );
  }
}
