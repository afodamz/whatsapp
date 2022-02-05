import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
          storyItems: [
            StoryItem.text(
              title: "I guess you'd love to see more of our food. That's great.",
              backgroundColor: Colors.blue,
            ),
            StoryItem.text(
              title: "Nice!\n\nTap to continue.",
              backgroundColor: Colors.red,
              textStyle: TextStyle(
                fontFamily: 'Dancing',
                fontSize: 40,
              ),
            ),
            StoryItem.pageImage(
              url:
              "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
              caption: "Still sampling",
              controller: storyController,
            ),
            StoryItem.pageImage(
                url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                caption: "Working with gifs",
                controller: storyController),
            StoryItem.pageImage(
              url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
              caption: "Hello, from the other side",
              controller: storyController,
            ),
            StoryItem.pageImage(
              url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
              caption: "Hello, from the other side2",
              controller: storyController,
            ),
            // StoryItem.pageVideo(
            //   controller: storyController,
            // ),
          ],
          onStoryShow: (s) {
            print("Showing a story");
          },
          onComplete: () {
            print("Completed a cycle");
          },
          progressPosition: ProgressPosition.top,
          repeat: false,
          controller: storyController,
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                Navigator.pop(context);
              }
            }
        ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.1+5,
            child: Container(
              child: Row(
                children: [
                  IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back), color: Colors.white,),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Afolabi Oluwadamilola", style: TextStyle(color: Colors.white),),
                      Text("4 minutes ago", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 70),
                      child: IconButton(onPressed: ()=>print("working"), icon: Icon(Icons.more_vert, color: Colors.white,)))
                ],
              ),
            ),
          )
      ]
      ),
    );
  }
}
