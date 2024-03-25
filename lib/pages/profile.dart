import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.email)
        .get();
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
              'Profile',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontFamily: "Blackhansans",
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Icon(Icons.logout,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data() ?? {};
            return Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "${user['name'] ?? ''}",
                    style: const TextStyle(
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
                    const Expanded(
                      child: Column(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              color: Colors.grey[200],
                            ),
                          );
                        }))
              ],
            );
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }
}
