import 'package:flutter/material.dart';
import './MapPage.dart' as first;
import './EventsPage.dart' as second;
import './MyEventsPage.dart' as third;
import './CreateEventPage.dart' as fourth;

Color roskildeOrange = const Color.fromARGB(255, 255, 115, 0);

void main() {
  runApp(new MaterialApp(
    home: new MyTabs(),
  ));
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
