import 'package:flutter/material.dart';
import 'package:whatsapp/components/storypage.dart';
import 'package:whatsapp/models/statusmodel.dart';


class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
                  Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                        ),
                        child: Icon(
                            Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    bottom: 0.0,
                    right: 1.0,
                  )
                ],
              ),
              title: Text("Afolabi Ope"),
              subtitle: Row(
                children: [
                  Text("Tap to add status update"),
                ],
              ),
              trailing: Icon(Icons.more_horiz, color: Colors.green,),
              onTap: (){print("working");},
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            alignment: Alignment.centerLeft,
              child: Text("Recent Updates")
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: ListView.builder(
                itemCount: StatusModel.getData(context).length,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      Container(
                        child: ListTile(
                    leading: CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.lightGreen,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(StatusModel.getData(context)[index].image),
                  ),
                  title: Text(StatusModel.getData(context)[index].name),
                  subtitle: Row(
                  children: [
                  Text(StatusModel.getData(context)[index].time),
                  ],
                  ),
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> StoryPage())),
                  ),
                      )
                    ],
                  );
                },

              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Text("More Updates")
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.lightGreen,)
            ],
          ),
        ],
      ),
    );
  }
}
