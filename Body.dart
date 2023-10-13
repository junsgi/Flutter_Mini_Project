import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SelectMonthBT.dart';
import 'SelectYearBT.dart';
import 'Diary.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({super.key,
    this.pprint,
    this.nowYear,
    this.setNowYear,
    this.nowMonth,
    this.setNowMonth,
    this.compare,
    this.getToday,
    this.removeValue
  });
  final pprint;
  final nowYear;
  final setNowYear;
  final nowMonth;
  final setNowMonth;
  final compare;
  final getToday;
  final removeValue;



  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  returnYM() async{
    var a = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        itemCount: widget.pprint.length + 2,
        itemBuilder: (context, index) {
          if (index < 2) {
            return index == 0
                ? SelectYearBT(
                nowYear: widget.nowYear.toString(), setNowYear: widget.setNowYear)
                : SelectMonthBT(
                nowMonth: widget.nowMonth.toString(), setNowMonth: widget.setNowMonth);
          } else if (widget.compare(widget.pprint[widget.pprint.length - 1 - (index - 2)]['dateTime'].toString())){
            return ListTile(
              title: Diary(
                getToday: widget.getToday,
                info: widget.pprint[widget.pprint.length - 1 - (index - 2)],
                removeValue : widget.removeValue,
              ),
            );
          }
          return null;
        });
  }
}
