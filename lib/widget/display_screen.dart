import 'package:calculator/utile/colors.dart';
import 'package:calculator/utile/dimention.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final nameAlg;
  final numDisplay;
  final numHistory;
  const DisplayScreen(
      {super.key, this.nameAlg, this.numDisplay, this.numHistory});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: Dimenstions.height270,
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.BorderColor,
            width: Dimenstions.BorderWidth5 + 2,
          ),
          color: AppColor.boxcolors,
          borderRadius: BorderRadius.circular(Dimenstions.Radius20)),
      child: Padding(
        padding: EdgeInsets.only(right: Dimenstions.width10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Dimenstions.height40,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                numHistory,
                style: TextStyle(
                  fontFamily: 'digital',
                  fontSize: Dimenstions.fontSize30,
                  color: Color.fromARGB(163, 0, 0, 0),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                numDisplay,
                style: TextStyle(
                  fontFamily: 'digital',
                  fontSize: Dimenstions.fontSize65,
                  color: Color.fromARGB(163, 0, 0, 0),
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_right,
                  size: Dimenstions.IconSize40,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Dimenstions.height10),
                  child: Text(
                    nameAlg,
                    style: TextStyle(
                      fontFamily: 'digital',
                      fontWeight: FontWeight.bold,
                      fontSize: Dimenstions.fontSize30,
                      color: Color.fromARGB(229, 24, 23, 23),
                      letterSpacing: 1,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
