import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_user_detail_flutter/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]) ;

    return MaterialApp(
      home: SearchScreen() ,
    );
  }
}

