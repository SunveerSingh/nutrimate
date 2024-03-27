import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutrimate/bot/aibot.dart';
import 'package:nutrimate/challenge/challenge.dart';
import 'package:nutrimate/scanner/camera.dart';
import 'package:nutrimate/trackign/tracking.dart';

class HomeScreen extends StatefulWidget {
  final CameraDescription camera;

  HomeScreen({
    required this.camera,
  }) : super();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 20);
  double gap = 10;

  int _index = 0;

  List<Widget> screens = [
    TrackingScreen(),
    PhotoCalorieScreen(),
    BotScreen(),
    ChallengeScreen()
  ];
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber.shade50,
        extendBody: true,
        body: PageView.builder(
            itemCount: 4,
            controller: controller,
            onPageChanged: (page) {
              setState(() {
                _index = page;
              });
            },
            itemBuilder: (context, position) {
              return Container(
                child: Center(child: screens[position]),
              );
            }),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 25),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: GNav(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                tabs: [
                  GButton(
                    gap: gap,
                    icon: Icons.home,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.teal,
                    text: 'Home',
                    textColor: Colors.teal,
                    backgroundColor: Colors.amber.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: Icons.camera_enhance,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.pink,
                    text: 'Scanner',
                    textColor: Colors.pink,
                    backgroundColor: Colors.pink.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: Icons.support_agent,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.lightBlue,
                    text: 'AI Bot',
                    textColor: Colors.lightBlue,
                    backgroundColor: Colors.lightBlue.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                  GButton(
                    gap: gap,
                    icon: Icons.leaderboard,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.teal,
                    text: 'Challenge',
                    textColor: Colors.teal,
                    backgroundColor: Colors.teal.withOpacity(0.2),
                    iconSize: 24,
                    padding: padding,
                  ),
                ],
                selectedIndex: _index,
                onTabChange: (index) {
                  setState(() {
                    _index = index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
