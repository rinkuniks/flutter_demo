import 'package:flutter/material.dart';
import 'package:login_flutter/BottomNavigate/Camera.dart';
import 'package:login_flutter/BottomNavigate/Home.dart';
import 'package:login_flutter/BottomNavigate/Profile.dart';
import 'main.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  var myList = [Home(), Camera(), Profile()];
  var myListNames = ['Home', 'Camera', 'Profile'];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myListNames[_currentIndex]),),
      body: myList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text('Camera')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Profile')
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
