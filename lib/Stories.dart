import 'package:flutter/material.dart';
import 'package:instagram_clone/Story.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var uuid = Uuid();

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  List<String> list=[];
  void getUserDetails() async {
    var url = Uri.parse("https://randomuser.me/api/?results=15");
    print(url);
    var response = await http.get(url);
    print(jsonDecode(response.body));
    List<String> temp=[];
    
    jsonDecode(response.body)["results"].forEach((x)=>{
      temp.add(x["picture"]['large'])
    });
    setState(() {
      list=temp;
    });
  }

  @override
  initState() {
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children:[
        // Story(imageUrl: ""),
        ...list.map((e) =>
           Story(imageUrl: e)
        ).toList()
      ],
    );
  }
}
