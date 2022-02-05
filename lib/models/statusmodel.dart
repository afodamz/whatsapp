import 'package:flutter/cupertino.dart';

class StatusModel{
  String name;
  String image;
  String time;

  StatusModel(this.name, this.image, this.time);

  static List<StatusModel> getData(BuildContext context){
    return [
      StatusModel("Olanrewaju", "assets/profile.jpg", "30 seconds ago"),
      StatusModel("Tosin", "assets/profile.jpg", "15 minutes ago"),
      StatusModel("Temitope", "assets/profile.jpg", "1 day ago"),
      StatusModel("Emmanuel", "assets/profile.jpg", "3 days ago"),
    ];
  }
}