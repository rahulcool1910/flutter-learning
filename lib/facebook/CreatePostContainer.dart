import 'package:flutter/material.dart';
import 'package:instagram_clone/facebook/postOptionButton.dart';
import 'package:instagram_clone/models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    super.key,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(currentUser.imageUrl),
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "What's on your mind?",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )
            ],
          ),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                PostOptionButton(
                  icon: Icons.videocam,
                  text: "Live",
                  color: Colors.red,
                ),
                VerticalDivider(color: Colors.red, width: 3, thickness: 0.2),
                PostOptionButton(
                    icon: Icons.add_photo_alternate,
                    text: "Photos",
                    color: Colors.green),
                PostOptionButton(
                    icon: Icons.video_call_outlined,
                    text: "Room",
                    color: Colors.purple),
              ],
            ),
          )
        ],
      ),
    );
  }
}
