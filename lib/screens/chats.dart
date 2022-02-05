import 'package:flutter/material.dart';
import 'package:whatsapp/models/chatmodel.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: ChatModel.getChats().length,
          itemBuilder: (BuildContext context, int index)=>Column(
            children: [
              Container(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.lightGreen,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(ChatModel.getChats()[index].image),
                  ),
                  title: Text(ChatModel.getChats()[index].name),
                  subtitle: Text(ChatModel.getChats()[index].message),
                  trailing: Column(
                    children: [
                      Text(ChatModel.getChats()[index].date),
                      SizedBox(height: 5,),
                      if (ChatModel.getChats()[index].pin)...[
                        RotationTransition(
                          turns: new AlwaysStoppedAnimation(45 / 360),
                          child: new Icon(Icons.push_pin),
                        )
                      ]
                      // (()=> ?  : null)
                    ],
                  ),
                  onTap: (){print("working");},
                ),
              ),
            ],
          )
      ),
    );
  }
}
