// ignore_for_file: implementation_imports

import 'package:church_plugin/church_plugin.dart';
import 'package:church_plugin/src/ui/components/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Production();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MNButton(
                labelText: "Test button",
                onPressed: () {
                  // print("${ChurchPackage.current!.appName}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
