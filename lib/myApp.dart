import 'package:flutter/material.dart';
import 'package:flutter_application_2/logic/navigation/screen_body/body.dart';
import 'package:flutter_application_2/logic/navigation/bottom_nav_bar_factory.dart';

//starts up app
class MyApp extends StatelessWidget {
  final Body body;
  final BottomNavBarFactory bottomNavBarFactory;
  
  const MyApp({super.key, required this.body, required this.bottomNavBarFactory});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold
      (
        body: body,
        bottomNavigationBar: bottomNavBarFactory.getNavBar(),
      ),
    );
  }
}
