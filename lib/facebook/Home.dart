import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/config/palette.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:instagram_clone/config/palette.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/facebook/CircleButton.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'CreatePostContainer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void test() {}
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  bool showSearch = false;
  bool showAnimation = false;
  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  changeAppBarView() {
    setState(() {
      if (!showAnimation) {
        showAnimation = true;
      }
      showSearch = !showSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          centerTitle: false,
          floating: true,
          backgroundColor: Colors.white,
          flexibleSpace: AnimatedAppBar(
              showSearch: showSearch, showAnimation: showAnimation),
        ),
        SliverToBoxAdapter(
          child: ElevatedButton(
              onPressed: () {
                changeAppBarView();
              },
              child: Text("Button")),
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(currentUser: currentUser),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            color: Colors.amber,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            color: Colors.amber,
          ),
        ),
        SliverToBoxAdapter(
          child: VisibilityDetector(
            key: Key("widget"),
            onVisibilityChanged: (info) {
              if (info.visibleBounds.bottom == 0 &&
                  info.visibleBounds.top == 0 &&
                  info.visibleBounds.left == 0 &&
                  info.visibleBounds.right == 0) {
                print("Inside");
                setState(() {
                  showSearch = true;
                });
                return;
              }
              print("outside");
              setState(() {
                showSearch = false;
              });
            },
            child: Container(
              height: 100.0,
              color: Colors.red,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            color: Colors.blue,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100.0,
            color: Colors.green,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 1000.0,
            color: Colors.purple,
          ),
        ),
      ],
    ));
  }
}

class AnimatedAppBar extends StatelessWidget {
  final bool showSearch;
  final bool showAnimation;
  const AnimatedAppBar({
    super.key,
    required this.showSearch,
    required this.showAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
              duration: Duration(seconds: 1),
              child: showSearch
                  ? SearchBar()
                  : AppBar(
                      showAnimation: showAnimation,
                    ))),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 17),
        filled: true,
        contentPadding: EdgeInsets.all(0),
        prefixIcon: const Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30,
        ).animate().slideX(begin: -0.1, duration: 200.ms),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ).animate().slideX(begin: 0.2, duration: 200.ms),
        ),
        hintText: "Search in High Point",
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        //   borderRadius: BorderRadius.circular(5.0),
        // ),
      ),
    ).animate().fadeIn(duration: 500.ms);
  }
}

class AppBar extends StatefulWidget {
  final bool showAnimation;
  const AppBar({
    super.key,
    required this.showAnimation,
  });

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Animate(
            effects: widget.showAnimation
                ? [
                    const SlideEffect(
                      begin: Offset(0.05, 0),
                      end: Offset(-0.1, 0),
                      // duration: Duration(microseconds: 1000),
                    )
                  ]
                : [],
            child: Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.black,
            ),
          ),
          Animate(
              child: Text(
                "The High Point . 48Mins",
                style: TextStyle(fontSize: 17),
              ),
              effects: widget.showAnimation ? [const FadeEffect()] : []),
          Animate(
              effects: widget.showAnimation
                  ? [const SlideEffect(begin: Offset(-0.2, 0))]
                  : [],
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}



// var data=Scaffold(
//         body: CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           backgroundColor: Colors.white10,
//           title: const Text(
//             "Facebook",
//             style: TextStyle(
//                 color: Palette.facebookBlue,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: -1.2),
//           ),
//           centerTitle: false,
//           floating: true,
//           systemOverlayStyle: SystemUiOverlayStyle.dark,
//           actions: [
//             CircleButton(
//               icon: Icons.search,
//               iconSize: 30,
//               onPressed: () {},
//               bgColor: Colors.grey,
//             ),
//             CircleButton(
//               icon: Icons.facebook,
//               iconSize: 30,
//               onPressed: () {},
//               bgColor: Colors.grey,
//             ),
//           ],
//         ),
//         SliverToBoxAdapter(
//           child: CreatePostContainer(currentUser: currentUser),
//         ),
//         SliverToBoxAdapter(
//           child: Container(
//             height: 1000.0,
//             color: Colors.amber,
//           ),
//         ),
//       ],
//     ));




    // !showSearch
    //         ? SliverAppBar(
    //             backgroundColor: Colors.white,
    //             leading: BackButton(
    //               color: Colors.black,
    //             ),
    //             title: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   "The High Joing . 48Mins",
    //                   style: TextStyle(color: Colors.black),
    //                 ),
    //               ],
    //             ),
    //             pinned: true,
    //             centerTitle: false,
    //             floating: false,
    //             systemOverlayStyle: SystemUiOverlayStyle.dark,
    //             actions: [
    //               CircleButton(
    //                 icon: Icons.search,
    //                 iconSize: 30,
    //                 onPressed: () {},
    //                 bgColor: Colors.grey,
    //               ),
    //             ],
    //           )
    //         : 