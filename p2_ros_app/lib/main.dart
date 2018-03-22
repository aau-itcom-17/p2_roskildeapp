import 'package:flutter/material.dart';
import 'package:p2_ros_app/pages/MapPage.dart' as first;
import 'package:p2_ros_app/pages/EventsPage.dart' as second;
import 'package:p2_ros_app/pages/MyEventsPage.dart' as third;
import 'package:p2_ros_app/pages/CreateEventPage.dart' as fourth;
import 'package:p2_ros_app/Login.dart' as login;

Color roskildeOrange = const Color.fromARGB(255, 255, 115, 0);

void main() {
  runApp(new login.MyApp());
  /*MaterialApp(
  home: new MyTabs(),
  ));*/

}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: new Material(
          color: roskildeOrange,
          child: new TabBar(controller: controller, tabs: <Tab>[
            new Tab(icon: new Icon(Icons.map)),
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.favorite)),
            new Tab(icon: new Icon(Icons.add)),
          ])),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.Map(),
          new second.Events(),
          new third.MyEvents(),
          new fourth.CreateEvent()
        ],
      ),
    );
  }
}
