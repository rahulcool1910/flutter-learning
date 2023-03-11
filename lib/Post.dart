import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/types/types.dart';

class Post extends StatelessWidget {
  final IPost post;
  final String image;

  const Post({Key? key, required this.post, required this.image})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: NetworkImage(post.url),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.brown.shade300),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(image),
                            radius: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.author,
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Sandiago USA",
                                style: TextStyle(
                                    color: Colors.grey.shade300, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PostIconButton(icon: Icons.bookmark_outline)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      PostIconButton(icon: FontAwesomeIcons.message),
                      SizedBox(
                        width: 10,
                      ),
                      PostIconButton(icon: FontAwesomeIcons.paperPlane),
                    ],
                  ),
                  PostIconButton(
                      icon: FontAwesomeIcons.heart,
                      selectedIconState: FontAwesomeIcons.solidHeart)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostIconButton extends StatefulWidget {
  final dynamic icon;
  final dynamic selectedIconState;

  const PostIconButton({Key? key, required this.icon, this.selectedIconState})
      : super(key: key);

  @override
  State<PostIconButton> createState() => _PostIconButtonState();
}

class _PostIconButtonState extends State<PostIconButton> {
  bool isActive = false;

  void onClick() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  void initState() {
    print("widget ${widget.icon.runtimeType == IconData}");
  }

  Widget getButton(){
    return widget.icon.runtimeType == IconData
        ? Icon(
      widget.icon,
      color: Colors.grey.shade800,
      size: 20.0,
    )
        : isActive
        ? FaIcon(
      widget.selectedIconState,
      color: Colors.red,
      size: 20.0,
    )
        : FaIcon(
      widget.icon,
      color: Colors.grey.shade800,
      size: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 2.0,
        shape: CircleBorder(),
        fillColor: Colors.white,
        onPressed: () {
          onClick();
        },
        constraints: const BoxConstraints.tightFor(
          width: 45.0,
          height: 45.0,
        ),
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          child: getButton()
        ) 
    );
  }
}
