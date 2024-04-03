import 'package:flutter/material.dart';

class CommentPost extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  const CommentPost({
    super.key,
    required this.text,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      user,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Text(text),
              ],
            ),
          )
        ],
      ),
    );
  }
}
