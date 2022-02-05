
class ChatModel{
  String image;
  String name;
  String date;
  bool pin;
  String message;

  ChatModel(this.image, this.name, this.date, this.pin, this.message);

  static List<ChatModel> getChats(){
    return [
      ChatModel("assets/profile.jpg", "Afolabi damilare", "2022-02-04", true, "Where you dey"),
      ChatModel("assets/profile.jpg", "Afolabi damilola", "2022-02-04", true, "Pay my money"),
      ChatModel("assets/profile.jpg", "Afolabi daramola", "2022-02-04", false, "More money"),
      ChatModel("assets/profile.jpg", "Sosanya femi", "2022-02-04", false, "i am a programmer"),
      ChatModel("assets/profile.jpg", "Afolayan Olaitan", "2022-02-04", false, "i am working"),
      ChatModel("assets/profile.jpg", "Fapounda Femi", "2022-02-04", false, "How you dey")
    ];
  }
}