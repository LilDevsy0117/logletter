import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logletter/firestore.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final FirestoreService firestoreService = FirestoreService();
  late String name = '';
  late int numOfLog = 0;

  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    String tempname = await firestoreService.getUserName();
    setState(() {
      name = tempname;
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              name,
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
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('logs')
                      .where('name', isEqualTo: name)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      numOfLog = snapshot.data!.docs.length;
                    }
                    return Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              numOfLog.toString(),
                              style: const TextStyle(
                                fontFamily: 'Blackhansans',
                                fontSize: 26,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Logs',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('logs')
                  .where('name', isEqualTo: name)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  numOfLog = snapshot.data!.docs.length;
                }
                return Expanded(
                    child: GridView.builder(
                        itemCount: numOfLog,
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
                        }));
              })
        ],
      ),
    );
  }
}
