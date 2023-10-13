import 'package:flutter/material.dart';
import 'SelectDialog.dart';
import 'package:google_fonts/google_fonts.dart';
// 일지 위젯
class Diary extends StatelessWidget {
  Diary({super.key, this.getToday, this.info, this.removeValue});
  final removeValue;
  final info;
  final getToday;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color : Colors.black.withOpacity(0.7), spreadRadius: 1, blurRadius: 5, offset: Offset(5, 5)),]
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color.fromRGBO(176, 89, 37, 1)),
          onLongPress: (){
            showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(info['title']),
                    content: Text('삭제하시겠습니까?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('아니요'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('삭제'),
                        onPressed: () {
                          removeValue(info);
                          Navigator.pop(context);

                        },
                      )
                    ],
                  );
                },
              );

          },
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return SelectDialog(info: info);
                });
          },
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(

                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info['title'].toString().length > 5 ? info['title'].toString().substring(0, 5) + '...' : info['title'].toString(),
                            style: GoogleFonts.jua(
                                textStyle : TextStyle(fontSize: 30, color: Color.fromRGBO(253, 237, 212, 1))),
                          ),

                          Text(
                            info['comment'].toString().length > 7 ?
                            info['comment'].toString().substring(0, 7) + '...': info['comment'],
                            style: GoogleFonts.jua(
                                textStyle : TextStyle(fontSize: 25, color: Color.fromRGBO(253, 237, 212, 1))),
                          ),
                          Text('${info['dateTime'].toString().substring(5, 16)}',
                            style: GoogleFonts.jua(
                                textStyle : TextStyle(fontSize: 20, color: Color.fromRGBO(253, 237, 212, 1))),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: info['howDay'] == '1'
                        ? Icon(
                      Icons.sentiment_satisfied_alt_rounded,
                      size: 70,
                      color: Colors.greenAccent,
                    )
                        : info['howDay'] == '2'
                        ? Icon(
                      Icons.sentiment_neutral_rounded,
                      size: 70,
                      color: Colors.orangeAccent,
                    )
                        : Icon(Icons.sentiment_very_dissatisfied,
                        size: 70, color: Colors.redAccent),
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}
