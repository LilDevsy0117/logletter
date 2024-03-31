import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logletter/controller/log_controller.dart';
import 'package:logletter/model/log.dart';

class UserPosts extends StatelessWidget {
  final Log post;
  final LogController logController = Get.find();
  UserPosts({
    super.key,
    required this.post,
  });

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
                      () => Icon(
                        post.isLiked.value
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: post.isLiked.value ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  logController.toggleSub(post);
                },
                child: Obx(
                  () => Icon(
                    post.isSubed.value ? Icons.bookmark : Icons.bookmark_border,
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
