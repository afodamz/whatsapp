import 'package:flutter/material.dart';

class CallsModel{
  String image;
  String name;
  String type;
  String calltypeIcon;
  String time;

  CallsModel(this.image, this.name, this.type, this.calltypeIcon, this.time);

  static List<CallsModel> getData(BuildContext context){
    return [
      CallsModel("assets/profile.jpg", "Mom", "missed_incoming", "voice_call", "2022-02-04"),
      CallsModel("assets/profile.jpg", "M Mum", "missed_incoming", "voice_call", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Afolabi ope", "incoming", "video", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Afolabi Daramola", "incoming", "video", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Afolabi Damilare", "incoming", "video", "2022-02-04"),
      CallsModel("assets/profile.jpg", "M Dad", "outgoing", "voice_call", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Mayowa", "outgoing", "voice_call", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Afolayan Olaitan", "missed_incoming", "video", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Sosanya femi", "outgoing", "voice_call", "2022-02-04"),
      CallsModel("assets/profile.jpg", "Fapounda Olakunle", "outgoing", "voice_call", "2022-02-04"),
    ];
  }
}
