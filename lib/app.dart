import 'package:flutter/material.dart';
import 'repo_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new RepoPage()
    );
  }
}