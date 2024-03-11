import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
              'Profile',
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
      body: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "이상엽",
              style: TextStyle(
                fontFamily: "NotoSans",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: const Column(
                    children: [
                      Text(
                        '123',
                        style: TextStyle(
                          fontFamily: 'Blackhansans',
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Likes',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: const Column(
                    children: [
                      Text(
                        '45',
                        style: TextStyle(
                          fontFamily: 'Blackhansans',
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Column(
                    children: [
                      Text(
                        '7',
                        style: TextStyle(
                          fontFamily: 'Blackhansans',
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Logs',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        color: Colors.grey[200],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
