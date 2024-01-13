

import 'dart:html';
import 'dart:ui';

import 'package:dogcatcher/pages/report_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dog_release.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> dogImages = [
    'https://placekitten.com/200/300',
    'https://placekitten.com/201/300',
  ];

  bool showHelpText = false;
  bool showMenuText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/2557bde11ab9d0f.jpg"),
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.help),
                onPressed: () {
                  setState(() {
                    showHelpText = !showHelpText;
                  });
                },
              ),
              if (showHelpText) Text('Help'),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    showMenuText = !showMenuText;
                  });
                },
              ),
              if (showMenuText) Text('Menu'),
            ],
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/OIP.jpeg", fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => DogAttackReportPage()),
                            (route) => false,
                      );
                    },
                    child: Text('Report Stray Dog',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      primary: Colors.transparent,
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage("images/images.jpeg"),
                    radius: 75,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => StrayDogReleasePage()),
                            (route) => false,
                      );
                    },
                    child: Text('Release Dog',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.all(20),
                      primary: Colors.black,
                      shape: OvalBorder()
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/images2.jpeg",),
                    radius: 75,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),

            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
