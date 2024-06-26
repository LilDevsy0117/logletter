import 'package:flutter/material.dart';
import 'package:logletter/components/comment_post.dart';
import 'package:logletter/model/log.dart';

class Comment extends StatelessWidget {
  final Log post;
  const Comment({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Positioned(
          top: 5,
          child: Container(
            width: 60,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: List.generate(
              10,
              (index) => const CommentPost(text: '1', user: '1', time: '1'),
            ),
          ),
        ),
      ],
    );
  }
}


// Expanded(
        //   child: StreamBuilder(
        //     stream: FirebaseFirestore.instance
        //         .collection("logs")
        //         .doc(post.docID)
        //         .collection("Comments")
        //         .orderBy(
        //           "CommentTime",
        //           descending: true,
        //         )
        //         .snapshots(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //           // shrinkWrap: true,
        //           itemCount: snapshot.data!.docs.length,
        //           itemBuilder: (context, index) {
        //             final commentData = snapshot.data!.docs[index];
        //             return Container(
        //               height: 10,
        //               color: Colors.black,
        //             );
        //           },
        //         );
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text('Error:${snapshot.error}'),
        //         );
        //       }
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     },
        //   ),
        // ),