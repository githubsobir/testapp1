import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:testapp1/core/color_test_ui.dart';
import 'package:testapp1/testlash_string.dart';

PreferredSizeWidget appBarUi(
  String title,
) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    backgroundColor: ColorsApp.colorBackground,
    iconTheme: const IconThemeData(color: Colors.white),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 30, top: 20),
        child: TimerCountdown(
          format: CountDownTimerFormat.hoursMinutesSeconds,
          enableDescriptions: false,
          colonsTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          timeTextStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          endTime: DateTime.now().add(
            const Duration(
              hours: TestlashUchun.hh,
              minutes: TestlashUchun.mm,
              seconds: TestlashUchun.ss,
            ),
          ),
          onEnd: () {
            print("Timer finished");
          },
        ),
      ),
    ],
    titleTextStyle: const TextStyle(
        color: ColorsApp.colorWhiteTitle,
        fontSize: 22,
        fontWeight: FontWeight.bold),
    bottom: const TabBar(
      tabs: [
        Tab(
            icon: Icon(
          Icons.access_time_outlined,
          color: Colors.white,
          weight: 10,
        )),
        Tab(
            icon: Icon(
          Icons.newspaper,
          color: Colors.white,
        )),
      ],
    ),
  );
}
