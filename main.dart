import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'InsertDialog.dart';
import 'Body.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final firestore = FirebaseFirestore.instance;
var pprint = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(Duration(seconds: 2));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  first();
  runApp(MaterialApp(home: MyApp()));
  FlutterNativeSplash.remove();

}

first() async {
  pprint.clear();
  var b = await SharedPreferences.getInstance();
  b.getKeys().forEach((String element) {
    var r = b.getString(element) ?? '없음';
    addInit(jsonDecode(r));
  });
}

addInit(value) {
  pprint.add(value);
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// myApp
class _MyAppState extends State<MyApp> {
  DateTime getToday() {
    DateTime now = DateTime.now();
    return now;
  }

  var nowYear = DateTime.now().year;
  var nowMonth = DateTime.now().month;
  var logState = false;

  getNowYear() {
    return nowYear.toString();
  }

  getNowMonth() {
    return nowMonth.toString();
  }

  var nowTapPage = {
    'pageYear': 0,
    'pageMonth': 0,
  };


  @override
  void initState() {
    super.initState();
    nowTapPage = {
      'pageYear': DateTime.now().year,
      'pageMonth': DateTime.now().month,
    };

  }

  compare(String data) {
    String y = data.substring(0, 4);
    String m = data.substring(5, 7);
    return y == nowTapPage['pageYear'].toString() &&
        m ==
            (nowTapPage['pageMonth']! < 10
                ? ("0" + nowTapPage['pageMonth'].toString())
                : nowTapPage['pageMonth'].toString());
  }

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
  var checkIcon = [
    Icon(
      Icons.star,
      size: 70,
      color: Colors.greenAccent,
    ),
    Icon(
      Icons.calculate,
      size: 70,
      color: Colors.orangeAccent,
    ),
    Icon(Icons.catching_pokemon, size: 70, color: Colors.redAccent),
  ];

  var myData = {
    'title': '제목없음',
    'howDay': '2',
    'howSleep': '2',
    'howMeal': '2',
    'comment': '없음',
    'dateTime': DateTime.now().toString(),
  };

//day == '1' ? myIcon[0] : day == '2' ? myIcon[1] : myIcon[2]
  setMyData(key, value) {
    setState(() {
      switch (key) {
        case 'title':
          myData['title'] = value == '' ? '제목없음' : value;
          break;
        case 'howDay':
          myData['howDay'] = value == '' ? '2' : value;
          break;
        case 'howSleep':
          myData['howSleep'] = value == '' ? '2' : value;
          break;
        case 'howMeal':
          myData['howMeal'] = value == '' ? '2' : value;
          break;
        case 'comment':
          myData['comment'] = value == '' ? '없음' : value;
          break;
      }
      myData['dateTime'] = DateTime.now().toString();
    });
  }

  getMyData() {
    return myData;
  }

  removeValue(value) async {
    var a = await SharedPreferences.getInstance();
    setState(() {
      a.remove(value['dateTime'].toString().substring(0, 19));
      pprint.remove(value);
    });
  }

  addShareData(Map<String, String> value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(
        value['dateTime'].toString().substring(0, 19), jsonEncode(value));
  }

  addPrint() {
    setState(() {
      pprint.addAll([myData]);
      addShareData(myData);

      myData = {
        'title': '제목없음',
        'howDay': '2',
        'howSleep': '2',
        'howMeal': '2',
        'comment': '없음',
        'dateTime': DateTime.now().toString(),
      };
    });
  }

  setNowYear(value) {
    setState(() {
      if (value == '-') {
        nowYear--;
      } else if (value == '+' && nowYear < getToday().year) {
        if (nowYear + 1 == getToday().year && nowMonth > getToday().month) {
          nowMonth = getToday().month;
        }
        nowYear++;
      }
      nowTapPage['pageYear'] = nowYear;
      nowTapPage['pageMonth'] = nowMonth;
    });
  }

  setNowMonth(value) {
    setState(() {
      if (value == '-' && nowMonth > 1) {
        nowMonth--;
      } else if (value == '+' &&
          ((nowYear != getToday().year && nowMonth < 12) ||
              (nowYear == getToday().year && nowMonth < getToday().month))) {
        nowMonth++;
      }
      nowTapPage['pageMonth'] = nowMonth;
    });
  }


  @override
  build(context) {
    return Scaffold(

        backgroundColor: Color.fromRGBO(253, 237, 212, 1),

        appBar: AppBar(
          title:
          Image.asset('assets/appBar01.png', width: double.infinity,),
          centerTitle: true,
          backgroundColor:  Color.fromRGBO(245,172,78, 1),
        ),

        floatingActionButton: FloatingActionButton.large(
          backgroundColor:  Color.fromRGBO(176, 89, 37, 1),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return InsertDialog(
                      setMyData: setMyData,
                      getMyData: getMyData,
                      addPrint: addPrint,
                      myIcon: myIcon,
                      checkIcon: checkIcon);
                });
          },
          child: Icon(Icons.add, size: 80, color : Color.fromRGBO(253, 237, 212, 1)),
        ),
        body: Body(
            pprint: pprint,
            nowYear: nowYear,
            setNowYear: setNowYear,
            nowMonth: nowMonth,
            setNowMonth: setNowMonth,
            compare: compare,
            getToday: getToday,
            removeValue: removeValue));
  }
}
