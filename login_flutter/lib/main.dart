import 'package:flutter/material.dart';
import 'LoginUI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // primaryColor: Color(0xFF183451),
        primaryColor: Color(0xFF000000),
        accentColor: Colors.yellowAccent
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login Page',
            // style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: LoginUI(),
      ),
    );
  }
}


// Log
//5-lifecycle- https://www.youtube.com/watch?v=D_IWy2BXnEI
//1-Api call- https://www.youtube.com/watch?v=wlwVJ7E34Tc
//2-bottom Navigation-
//3-DB- https://www.youtube.com/watch?v=zkxBSCig3zs
//4-Camera
//6- min SDK and min versions- https://stackoverflow.com/questions/52060516/how-to-change-android-minsdkversion-in-flutter-project
//7- Firebase- https://www.youtube.com/watch?v=13-jNF984C0
