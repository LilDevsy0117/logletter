import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logletter/components/comment.dart';
import 'package:logletter/components/login_textfield.dart';
import 'package:logletter/controller/log_controller.dart';
import 'package:logletter/model/log.dart';

class UserPosts extends StatelessWidget {
  final Log post;
  final LogController logController = Get.find();
  final _commentController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser!;
  UserPosts({
    super.key,
    required this.post,
  });

  void addComment() {
    if (_commentController.text.isNotEmpty) {
      FirebaseFirestore.instance
          .collection("logs")
          .doc(post.docID)
          .collection("Comments")
          .add({
        'CommentText': _commentController.text,
        'CommentedBy': currentUser.email,
        'CommentTime': Timestamp.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    logController.isPostLiked(post);

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
                    post.name,
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
              post.log,
              style: const TextStyle(
                fontFamily: "NotoSans",
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      logController.toggleLike(post);
                    },
                    child: Obx(
                      () => Column(
                        children: [
                          Icon(
                            post.isLiked.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: post.isLiked.value
                                ? Colors.red
                                : Theme.of(context).colorScheme.inversePrimary,
                          ),
                          Text(post.like.length.toString()),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.0),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return DraggableScrollableSheet(
                                      expand: false,
                                      initialChildSize: 0.4,
                                      maxChildSize: 0.9,
                                      minChildSize: 0.32,
                                      builder: (context, scrollController) {
                                        return Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              bottom: 110,
                                              left: 0,
                                              right: 0,
                                              child: SingleChildScrollView(
                                                  controller: scrollController,
                                                  child: Comment(post: post)),
                                            ),
                                            Positioned(
                                              bottom: 20,
                                              left: 0,
                                              right: 0,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0,
                                                    top: 20,
                                                    right: 20,
                                                    left: 20),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: MyTextField(
                                                        controller:
                                                            _commentController,
                                                        hintText:
                                                            "댓글로 공감 하기...",
                                                        obscureText: false,
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: addComment,
                                                        icon: const Icon(
                                                            Icons.send)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              );
                            },
                            child: const Icon(Icons.chat_bubble_outline)),
                        Text(post.comment.length.toString()),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  logController.toggleSub(post);
                },
                child: Obx(
                  () => Column(
                    children: [
                      Icon(
                        post.isSubed.value
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                      ),
                      Text(post.subscribe.length.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
