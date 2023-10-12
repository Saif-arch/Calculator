import 'package:calculator/utile/colors.dart';
import 'package:calculator/utile/dimention.dart';
import 'package:calculator/widget/button.dart';
import 'package:calculator/widget/display_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var firstNum;
  var secondNum;
  String History = "";
  String res = '';
  late String operator;
  String ArithName = '';
  String allAlg = '';
  String textDisplay = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.BackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(
            top: Dimenstions.height50,
            bottom: Dimenstions.height20,
            left: Dimenstions.width20,
            right: Dimenstions.width20,
          ),
          child: Column(children: [
            DisplayScreen(
              nameAlg: allAlg,
              numDisplay: textDisplay,
              numHistory: History,
            ),
            SizedBox(
              height: Dimenstions.height25,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'A/C',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                    ),
                    Button(
                      text: 'C',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                    ),
                    Button(
                      text: '%',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                    ),
                    Button(
                      text: '/',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                      textSize: Dimenstions.height25,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: '7',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '8',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '9',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '*',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                      textSize: Dimenstions.height40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: '4',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '5',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '6',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '-',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                      textSize: Dimenstions.height50,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: '1',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '2',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '3',
                      callBack: btnOnClick,
                    ),
                    Button(
                      text: '+',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                      textSize: Dimenstions.height40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: '0',
                      callBack: btnOnClick,
                    ),
                    SizedBox(
                      width: Dimenstions.width20,
                    ),
                    Button(
                      text: '.',
                      callBack: btnOnClick,
                      textSize: Dimenstions.height20,
                    ),
                    SizedBox(
                      width: Dimenstions.width20,
                    ),
                    Button(
                      text: '=',
                      callBack: btnOnClick,
                      textColor: AppColor.TextColorlight,
                    ),
                  ],
                )
              ],
            ))
          ]),
        ));
  }

  void btnOnClick(String btnVal) {
    print(btnVal);

    if (btnVal == 'C') {
      textDisplay = '0';
      firstNum = '0';
      secondNum = '0';
      res = '';
      allAlg = '';
      ArithName = '';
      History = '';
    } else if (btnVal == 'A/C') {
      firstNum = '0';
      secondNum = '0';
      res = '';
      allAlg = '';
      ArithName = 'CLEAR';
      History = '';
    } else if (btnVal == '/' ||
        btnVal == '*' ||
        btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '%') {
      if (btnVal == '/') {
        ArithName = 'Divide';
      } else if (btnVal == '*') {
        ArithName = 'Multiply';
      } else if (btnVal == '-') {
        ArithName = 'Subtract';
      } else if (btnVal == '+') {
        ArithName = 'ADD';
      } else if (btnVal == '%') {
        ArithName = 'Percentage';
      } else {
        ArithName = '';
      }
      firstNum = int.parse(textDisplay);
      res = '';
      operator = btnVal;
    } else if (btnVal == '=') {
      ArithName = 'Equal';
      secondNum = int.parse(textDisplay);
      if (operator == '+') {
        res = (firstNum + secondNum).toString();
        History =
            firstNum.toString() + operator.toString() + secondNum.toString();
      }
      if (operator == '-') {
        res = (firstNum - secondNum).toString();
        History =
            firstNum.toString() + operator.toString() + secondNum.toString();
      }
      if (operator == '*') {
        res = (firstNum * secondNum).toString();
        History =
            firstNum.toString() + operator.toString() + secondNum.toString();
      }
      if (operator == '/') {
        res = (firstNum / secondNum).toString();
        History =
            firstNum.toString() + operator.toString() + secondNum.toString();
      }
      if (operator == '%') {
        res = (firstNum * secondNum/100).toString();
        History =
            firstNum.toString() + operator.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textDisplay + btnVal).toString();
    }
    setState(() {
      textDisplay = res;
      allAlg = ArithName;
    });
  }
}
