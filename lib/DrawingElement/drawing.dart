import 'package:flutter/material.dart';
import 'dart:math' as math;

class Drawing extends StatefulWidget {
  const Drawing({super.key});

  @override
  State<Drawing> createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double weight = MediaQuery.of(context).size.width;
    return Container(
          height: 300,
          width: 400,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // first of all define paint object that will hold the property of our paint
    final paint = Paint();
    final paint2 = Paint();
    final paint3 = Paint();
    // add the property of your paint
    paint
      ..color = Color.fromARGB(255, 224, 140, 134)
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    paint2
      ..color = Colors.green
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    paint3
      ..color = Colors.red
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width * 0.5, size.height * 0.8), radius: 150),
        math.pi,
        math.pi / 3,
        false,
        paint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width * 0.5, size.height * 0.8), radius: 150),
        math.pi + math.pi / 3,
        math.pi / 3,
        false,
        paint2);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width * 0.5, size.height * 0.8), radius: 150),
        math.pi + 2 * math.pi / 3,
        math.pi / 3,
        false,
        paint3);

    // text styles for showing refference bmi value
    final textStyle =  TextStyle(
    
      color: Colors.black,
      fontSize: 16,
    );

    // Define text to be drawn
    final text1 = TextSpan(
      text: '<18.5',
      style: textStyle,
    );

    final text2 = TextSpan(
      text: '18.5 - 24.5',
      style: textStyle,
    );

    final text3 = TextSpan(
      text: '40>=',
      style: textStyle,
    );

    // Create text painter objects
    final textPainter1 = TextPainter(
      text: text1,
      textDirection: TextDirection.ltr,
    );

    final textPainter2 = TextPainter(
      text: text2,
      textDirection: TextDirection.ltr,
    );

    final textPainter3 = TextPainter(
      text: text3,
      textDirection: TextDirection.ltr,
    );

    // Layout text
    textPainter1.layout();
    textPainter2.layout();
    textPainter3.layout();

    // Position text within the arc
    textPainter2.paint(
        canvas, Offset(size.width * 0.4 - 20, size.height * 0.8 - 120));
    textPainter3.paint(
        canvas, Offset(size.width * 0.4 + 110, size.height * 0.8 - 40));
    textPainter1.paint(
        canvas, Offset(size.width * 0.4 - 120, size.height * 0.8 - 40));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
