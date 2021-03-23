import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import './ui/home_page.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white
      ),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
