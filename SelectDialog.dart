import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDialog extends StatelessWidget {
  SelectDialog({super.key, this.info});

  final info;
  var ttt = [
    '오늘 하루',
    '수면',
    '식사',
    '하루 요약',
  ];
  var myIcon = [
    Icon(
      Icons.sentiment_satisfied_alt_rounded,
      size: 70,
      color: Colors.greenAccent,
    ),
    Icon(
      Icons.sentiment_neutral_rounded,
      size: 70,
      color: Colors.orangeAccent,
    ),
    Icon(Icons.sentiment_very_dissatisfied, size: 70, color: Colors.redAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromRGBO(239,236,217, 1),
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 10, 40, 30),
        height: 500,
        width: 400,
        child: ListView(
          children: [
          Text(
          info['title'],
          style: GoogleFonts.jua(
              textStyle : TextStyle(fontSize: 40, color: Colors.black)),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,

                  child: Column(
                    children: [
                      Text(
                        ttt[0],
                        style: GoogleFonts.jua(
                            textStyle : TextStyle(fontSize: 25, color: Colors.black)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: info['howDay'] == '1'
                              ? myIcon[0]
                              : info['howDay'] == '2'
                              ? myIcon[1]
                              : myIcon[2]),

                      Text(
                        ttt[1],
                        style: GoogleFonts.jua(
                            textStyle : TextStyle(fontSize: 25, color: Colors.black)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: info['howSleep'] == '1'
                              ? myIcon[0]
                              : info['howSleep'] == '2'
                              ? myIcon[1]
                              : myIcon[2]),


                      Text(
                        ttt[2],
                        style: GoogleFonts.jua(
                            textStyle : TextStyle(fontSize: 25, color: Colors.black)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: info['howMeal'] == '1'
                              ? myIcon[0]
                              : info['howMeal'] == '2'
                              ? myIcon[1]
                              : myIcon[2])

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
            Text(
              '하루 요약',
              style: GoogleFonts.jua(
                  textStyle : TextStyle(fontSize: 25, color: Colors.black)),
              textAlign: TextAlign.center,
            ),
            Text(
              info['comment'],
              style: GoogleFonts.jua(
                  textStyle : TextStyle(fontSize: 20, color: Colors.black)),
              textAlign: TextAlign.center,

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("확인"))
              ],
            )
          ]
        ),


    )
    );
  }
}
