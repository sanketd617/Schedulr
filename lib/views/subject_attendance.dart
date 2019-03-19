import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedulr/global.dart';
import 'package:schedulr/views/login.dart';
import 'package:intl/intl.dart';

class SubjectAttendancePage extends StatefulWidget {
  SubjectAttendancePage({Key key}) : super(key: key);

  @override
  _SubjectAttendancePageState createState() => _SubjectAttendancePageState();
}

class _SubjectAttendancePageState extends State<SubjectAttendancePage> {
  var months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    int curr_year = now.year;
    int curr_month = now.month;
    int whichHalf = curr_month > 6 && curr_month < 12 ? 2 : 1;
    int startMonth = curr_month > 6 && curr_month < 12 ? 7 : 12;
    int endMonth = curr_month > 6 && curr_month < 12 ? 11 : 4;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.grey[900],
          title: Text("Attendance"),
          actions: <Widget>[],
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var monthIndex = (startMonth + index - 1) % 12;
            return Column(
              children: <Widget>[
                _makeMonthView(context, monthIndex, curr_year)
              ],
            );
          },
          itemCount: 6,
        ));
  }

  Container _makeMonthView(BuildContext context, int monthIndex, int year) {
    const padding = 8.0;
    const margin = 4.0;
    var rows = <Widget>[];
    double width = MediaQuery.of(context).size.width;
    double height = width * 0.8571428571;
    double monthTitleHeight = height / 6;
    year = monthIndex < 6
        ? year
        : monthIndex >= 6 && monthIndex < 11 ? year : year - 1;
    int startDay = getFirstDay(year, monthIndex + 1);
    int day = 0;
    int count = 0;
    int numDays = getNumDays(year, monthIndex + 1);
    var attendanceTypes = [
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.absent,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.offLecture,
      AttendanceStatus.present,
      AttendanceStatus.present,
      AttendanceStatus.holiday,
      AttendanceStatus.present,
      AttendanceStatus.present,
    ];

    rows.add(InkWell(
      child: Container(
        height: monthTitleHeight,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: padding * 2),
        child: Text(
          months[monthIndex] + " " + year.toString(),
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      onTap: () {},
    ));

    for (int i = 0; i < 6; i++) {
      var columns = <Widget>[];
      for (int j = 0; j < 7; j++) {
        int attendanceStatus = attendanceTypes[new Random().nextInt(11)];

        String monthDay =
            count > startDay - 1 && day <= numDays ? day.toString() : "";
        Color color = attendanceStatus == AttendanceStatus.present
            ? Colors.greenAccent[100]
            : attendanceStatus == AttendanceStatus.absent
                ? Colors.redAccent
                : Colors.white;

        if (j == 0 || j == 6) {
          color = Colors.white;
        }

        if (monthDay == "") color = Colors.grey[300];

        columns.add(Container(
          height: (height - 2 * padding - 12 * margin) / 6,
          width: (width - 2 * padding - 14 * margin) / 7,
          margin: const EdgeInsets.all(margin),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey), color: color),
          child: Center(
            child: Text(
              monthDay,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ));
        count++;
        if (count > startDay - 1) day++;
      }

      rows.add(Row(
        children: columns,
      ));

      if (day > numDays) break;
    }

    return Container(
      width: width,
      height: height + monthTitleHeight,
      padding: const EdgeInsets.all(padding),
      child: Column(
        children: rows,
      ),
    );
  }

  int getFirstDay(int year, int month) {
    return new DateTime(year, month, 1, 12).weekday;
  }

  int getNumDays(int year, int month) {
    return new DateTime(year, month + 1, 0).day;
  }
}
