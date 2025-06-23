import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/navigation/main_shell.dart';
import 'package:flutter_application_2/presentation/navigation/page_descriptor.dart';

//starts up app
class MyApp extends StatelessWidget {
  final List<PageDescriptor> pages;
  
  const MyApp({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainShell(pages: pages),
    );
  }
}
