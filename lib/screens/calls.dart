import 'package:flutter/material.dart';
import 'dart:async';

import 'package:whatsapp/models/callModel.dart';
import 'package:whatsapp/utils/constants.dart';

class Calls extends StatelessWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: CallsModel.getData(context).length,
        itemBuilder: (BuildContext context, int index) => Column(
            children: [
              Container(
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.lightGreen,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(CallsModel.getData(context)[index].image),
                  ),
                  title: Text(CallsModel.getData(context)[index].name),
                  subtitle: Row(
                    children: [
                      _callType(CallsModel.getData(context)[index].type),
                      Text(CallsModel.getData(context)[index].time)
                    ],
                  ),
                  trailing: CallsModel.getData(context)[index].calltypeIcon =="voice_call" ? Icon(Icons.call, color: Colors.green,) : Icon(Icons.videocam, color: Colors.green,),
                  onTap: (){print("working");},
                ),
              )
            ]
        ),
      ),
    );
  }

  _callType(String val){
    switch(val) {
      case "missed_incoming": {
        return RotationTransition(
            turns: new AlwaysStoppedAnimation(45 / 360),
            child: Icon(Icons.arrow_downward, color: Colors.redAccent,)
        );
      }
      case "incoming": {
        //statements;
        return RotationTransition(
            turns: new AlwaysStoppedAnimation(45 / 360),
            child: Icon(Icons.arrow_downward, color: primary,)
        );
      }
      default: {
        //statements;
        return RotationTransition(
            turns: new AlwaysStoppedAnimation(45 / 360),
            child: Icon(Icons.arrow_upward, color: primary)
        );
      }
    }
  }
}
