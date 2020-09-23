import 'package:flutter/material.dart';
import 'package:login_flutter/Dashboard.dart';
import 'CustomBottomNavigation.dart';
import 'main.dart';
import 'dbmanager.dart';

class LoginUI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          // style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Enter Name...'),
              cursorColor: Colors.red,
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: 'Enter Password...'),
                  cursorColor: Colors.red,
                  style: TextStyle(color: Colors.red),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SizedBox(
                width: double.infinity,
                height: 45,
                child: RaisedButton(
                  child: Text('Login'),
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (context) => Dashboard()),
                      MaterialPageRoute(builder: (context) => CustomBottomNavigation()),
                    )
                  },
                )),
          )
        ],
      ),
    );
  }
}
