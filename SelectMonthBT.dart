import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 월 선택 버튼 <>
class SelectMonthBT extends StatelessWidget {
  SelectMonthBT({super.key, this.nowMonth, this.setNowMonth});

  final nowMonth;
  final setNowMonth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setNowMonth('-');
                },
                style: TextButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                child: Icon(Icons.arrow_back_ios, size: 30,)),
            TextButton(
                onPressed: () {},
              style: TextButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
              child: Text(
                  nowMonth,
                  style: GoogleFonts.jua(
                  textStyle : TextStyle(fontSize: 35, color: Color.fromRGBO(176, 89, 37, 1))),
                ),

    ),
            TextButton(

                style: TextButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                onPressed: () {
                  setNowMonth('+');
                },
                child: Icon(Icons.arrow_forward_ios, size: 30)),
          ],
        ));
  }
}
