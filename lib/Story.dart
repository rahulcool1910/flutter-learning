import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  final String imageUrl;

  const Story({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
    );
  }
}
