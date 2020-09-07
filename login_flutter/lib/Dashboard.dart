import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dash Board'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [Text('Hello 1')],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [Text('Hello 2')],
              ),
            )
          ],
        ));
  }
}
