import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 연도 선택 버튼
class SelectYearBT extends StatelessWidget {
  SelectYearBT({super.key, this.nowYear, this.setNowYear});

  final nowYear;
  final setNowYear;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: TextButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                onPressed: () {
                  setNowYear('-');
                },
                child: Icon(Icons.arrow_back_ios, size: 30,)),
            TextButton(
                style: TextButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),

                onPressed: () {},
                child: Text(nowYear, style: GoogleFonts.jua(
                    textStyle : TextStyle(fontSize: 40, color: Color.fromRGBO(176, 89, 37, 1))))),
            TextButton(
                style: TextButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                onPressed: () {
                  setNowYear('+');
                },
                child: Icon(Icons.arrow_forward_ios, size: 30,)),
          ],
        ));
  }
}
