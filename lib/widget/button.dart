import 'package:calculator/utile/colors.dart';
import 'package:calculator/utile/dimention.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final Function callBack;
  const Button(
      {super.key,
      required this.text,
      this.textColor = Colors.white,
      this.textSize = 25,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack(text);
      },
      child: Container(
        height: Dimenstions.height75,
        width: Dimenstions.height75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimenstions.Radius25),
            color: AppColor.BorderColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.white10,
                offset: Offset(-2, -2),
                blurRadius: 9,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.black87,
                offset: Offset(2, 2),
                blurRadius: 9,
                spreadRadius: 1,
              )
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF293136), Color(0xFF1A1C20)])),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: textSize, color: textColor),
          ),
        ),
      ),
    );
  }
}
