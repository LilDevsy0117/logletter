import 'package:flutter/material.dart';
import 'package:logletter/components/user_post.dart';

class UserHome extends StatelessWidget {
  final _controller = PageController(initialPage: 0);

  UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Logletter',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Blackhansans",
              ),
            ),
            Row(
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
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: const [
          UserPosts(
            name: '이상엽',
          ),
          UserPosts(
            name: '이상엽',
          ),
          UserPosts(
            name: '이상엽',
          ),
        ],
      ),
    );
  }
}
