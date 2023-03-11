import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/Post.dart';
import 'package:instagram_clone/types/types.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<IPost> list = [];

  int currPage = 1;
  bool hasMore = true;
  ScrollController? scrollController;

  @override
  initState() {
    scrollController = ScrollController();
    super.initState();
    getUserDetails();

    scrollController?.addListener(() {
      if (scrollController?.position.maxScrollExtent ==
              scrollController?.offset &&
          hasMore) {
        print("Inside");
        getUserDetails();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.removeListener(() {});
  }

  void getUserDetails() async {
    print("currPage $currPage");
    String url = "https://picsum.photos/v2/list?page=${currPage}&limit=10";
    var parsedUrl = Uri.parse(url);
    print("parsedUrl $parsedUrl");
    try {
      var response = await http.get(parsedUrl);
      print(jsonDecode(response.body));
      List<IPost> posts = [];

      jsonDecode(response.body).forEach((x) => {posts.add(IPost.fromJson(x))});
      if (posts.isEmpty) {
        hasMore = false;
      }
      setState(() {
        list.addAll(posts);
      });
      currPage++;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index < list.length) {
          return new Post(
              post: list[index],
              image: "https://xsgames.co/randomusers/avatar.php?g=male");
        }
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
