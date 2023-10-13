import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsertDialog extends StatefulWidget {
  InsertDialog({super.key, this.getMyData, this.setMyData, this.addPrint, this.myIcon, this.checkIcon});

  final getMyData;
  final setMyData;
  final addPrint;
  final myIcon;
  final checkIcon;
  @override
  State<InsertDialog> createState() => _InsertDialogState();
}

class _InsertDialogState extends State<InsertDialog> {
  var how = [
    '제목',
    '오늘 하루는 어떠셨나요?',
    "충분히 주무셨습니까?",
    "오늘 하루 식사는 어떠셨나요?",
    "하루 요약"
  ];

  var keys = ['title', 'howDay', 'howSleep', 'howMeal', 'comment'];
  var whiteColor = TextButton.styleFrom(backgroundColor: Colors.white);
  var otherColor = TextButton.styleFrom(backgroundColor: Color.fromRGBO(255, 214, 144, 0.5));
  var states = [
    [TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)),],
    [TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)),],
    [TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)),],
  ];
  setColor(int x, int y){
    setState(() {
        states[x] =     [TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)), TextButton.styleFrom(backgroundColor: Color.fromRGBO(253, 237, 212, 1)),];

      states[x][y] = TextButton.styleFrom(backgroundColor: Colors.blueAccent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromRGBO(253, 237, 212, 1),
      child: Container(
        margin: EdgeInsets.all(10),
        width: 650,
        height: 800,
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (c, i){
              if (i == 0 || i == 4){
                return Column(
                    children: [
                      Text(how[i], style: GoogleFonts.jua(
                          textStyle : TextStyle(fontSize: 30, color: Colors.black,)),),
                      TextField(
                        decoration: InputDecoration( filled: true, fillColor: Color.fromRGBO(253, 237, 212, 1), hintText: '${how[i]} 입력', enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Color.fromRGBO(176, 89, 37, 1), width: 3),borderRadius: BorderRadius.circular(15))),
                          onChanged: (context) {
                        widget.setMyData(keys[i], context);
                      }),
                    ],
                );
              }else if (i == 5){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("닫기")),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
                          onPressed: () {
                            widget.addPrint();
                            Navigator.pop(context);
                          },
                          child: Text("확인")),
                    )
                  ],
                );
              }else{
                return SizedBox(
                    width : 200,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(how[i], style: GoogleFonts.jua(
                            textStyle : TextStyle(fontSize: 25, color: Colors.black,)),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 1,
                                child: TextButton(
                                    style: states[i-1][0],
                                    onPressed: () {
                                      widget.setMyData(keys[i], '1');
                                      setColor(i - 1, 0);
                                      },
                                    child: widget.myIcon[0])),
                            Flexible(
                                flex: 1,
                                child: TextButton(
                                    style: states[i-1][1],
                                    onPressed: () {
                                      widget.setMyData(keys[i], '2');
                                      setColor(i - 1, 1);
                                    },
                                    child: widget.myIcon[1])),
                            Flexible(
                                flex: 1,
                                child: TextButton(
                                  style: states[i-1][2],
                                  onPressed: () {
                                    widget.setMyData(keys[i], '3');
                                    setColor(i - 1, 2);
                                  },
                                  child: widget.myIcon[2],
                                )),
                          ],
                        ),
                      ],
                    )
                );
              }

            }
        )


    ),);
  }
}