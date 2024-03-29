import 'package:flutter/material.dart';

class UserPosts extends StatelessWidget {
  final String log;
  final String name;
  final String email;
  final String time;
  final List<String> like;
  final List<String> subscribe;
  final List<String> comment;
  const UserPosts({
    super.key,
    required this.log,
    required this.name,
    required this.email,
    required this.time,
    required this.like,
    required this.subscribe,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontFamily: "NotoSans", fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        Container(
          height: 500,
          width: double.infinity,
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              log,
              style: const TextStyle(
                fontFamily: "NotoSans",
                fontSize: 20,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                ],
              ),
              Icon(Icons.bookmark),
            ],
          ),
        ),
      ],
    );
  }
}
