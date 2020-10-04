import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/page/HomePage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const tabCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: tabCount,
      child: Scaffold(
          body: TabBarView(
            children: [
              HomePage(),
              Center(child: Text('My cakes')),
              Center(child: Text('Contact')),
              Center(child: Text('Setting')),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: new Icon(Icons.cake),
                  text: 'My cakes',
                ),
                Tab(
                  icon: new Icon(Icons.people_alt),
                  text: 'Contact',
                ),
                Tab(
                  icon: new Icon(Icons.settings),
                  text: 'Setting',
                )
              ],
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
            ),
          )),
    ));
  }
}
