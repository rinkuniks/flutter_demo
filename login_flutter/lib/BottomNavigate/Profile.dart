import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  MyApp createState() => new MyApp();
}

class MyApp extends State<Profile> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    var sampleButton = 0;

    void onButtonPressed() {
      sampleButton = ++sampleButton;
    }

    return MaterialApp(
      title: ('Name is here'),
      home: Scaffold(
        body: Container(
            color: Colors.white,
            child: Container(
              child: GestureDetector(
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    RenderBox object = context.findRenderObject();
                    Offset _localPosition =
                        object.globalToLocal(details.globalPosition);
                    _points = new List.from(_points)..add(_localPosition);
                  });
                },
                onPanEnd: (DragEndDetails details) => _points.add(null),
                child: new CustomPaint(
                  painter: new FaceOutlinerPainter(points: _points),
                  size: Size.infinite,
                ),
              ),
            )),
      ),
    );
  }
}

class FaceOutlinerPainter extends CustomPainter {
  List<Offset> points;

  FaceOutlinerPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(FaceOutlinerPainter oldDelegate) =>
      oldDelegate.points != points;
}
