import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/calls.dart';
import 'package:whatsapp/screens/camera_page.dart';
import 'package:whatsapp/screens/camerascreen.dart';
import 'package:whatsapp/screens/chats.dart';
import 'package:whatsapp/screens/status.dart';
import 'package:whatsapp/utils/constants.dart';

class Home extends StatefulWidget {
  final List<CameraDescription> cameras;
  Home({required this.cameras});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  late TabController _tabController;
  late int selectedIndex;

  final controller = PageController(initialPage: 1);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController( vsync: this, length: 4, initialIndex: 1);
    selectedIndex = _tabController.index;
    _tabController.addListener(_handleTabIndex);
    selectedIndex=_tabController.index;
  }

  // final List<FloatingActionButton> fabs=[
  //   new FloatingActionButton(child: new Icon(Icons.access_time),onPressed: (){},),
  //   new FloatingActionButton(child: new Icon(Icons.account_balance),onPressed: (){},),
  //   new FloatingActionButton(child: new Icon(Icons.add_alert),onPressed: (){},)
  // ];

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState((){
      selectedIndex=_tabController.index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("WhatsApp"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
            indicatorColor: Colors.white,
            // labelColor: Colors.green,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt),),
              Tab(text: "chats".toUpperCase()),
              Tab(text: "status".toUpperCase()),
              Tab(text: "calls".toUpperCase()),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
          // children: [Camera(widget.cameras), Chats(), Status(), Calls()]),
          children: [CameraPage(controller: this.controller), Chats(), Status(), Calls()]),
      // floatingActionButton: fabs[selectedIndex],
      floatingActionButton: _bottomButtons(),
    );
  }

Widget _bottomButtons() {
  if (selectedIndex == 0){
    return Visibility(
      visible: false,
      child: FloatingActionButton(
        onPressed: () {print("do nothing");},
        backgroundColor: primary,
        child: Icon(Icons.add_call),
      ),
    );
  } else if(selectedIndex == 1){
    return FloatingActionButton(
      onPressed: () {print("do nothing");},
      backgroundColor: primary,
      child: Icon(Icons.message_rounded),
    );
  } else if(selectedIndex == 2){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
        onPressed: () {print("do nothing");},
  backgroundColor: Colors.grey,
  child: Icon(Icons.edit),
  ),
  SizedBox(height: 5,),
  FloatingActionButton(
  onPressed: () {print("do nothing");},
  backgroundColor: primary,
  child: Icon(Icons.camera_alt),
  )
      ],
    );
  } else {
    return FloatingActionButton(
      onPressed: () {print("do nothing");},
      backgroundColor: primary,
      child: Icon(Icons.add_call),
    );
  }
}

}
