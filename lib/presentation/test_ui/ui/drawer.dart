import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp1/core/color_test_ui.dart';
import 'package:testapp1/presentation/test_ui/provider_test_ui/riverpod_test_ui.dart';
import 'package:testapp1/testlash_string.dart';

Widget drawerUi(TestlashUchun testlashUchun, double heightDrawer, widthDrawer,
    BuildContext context) {
  return Container(
      height: heightDrawer * 1.9,
      width: widthDrawer * 0.5,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              endExam(context: context, testlashUchun: testlashUchun);
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(5),
              margin:
                  const EdgeInsets.only(top: 15, right: 5, bottom: 5, left: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "Testni yakunlash",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: testlashUchun.listSubjectInfo.length,
              itemBuilder: (context, i) => Column(
                children: [
                  const SizedBox(height: 5),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    testlashUchun.listSubjectInfo[i].scienceName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    width: widthDrawer * 0.5,
                    height: getHeight(
                            heightDrawer,
                            int.parse(testlashUchun
                                .listSubjectInfo[i].scienceCount)) +
                        20,
                    child: GridView.builder(
                      itemCount: int.parse(
                          testlashUchun.listSubjectInfo[i].scienceCount),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index2) {
                        return Consumer(
                          builder: (context, ref, child) => GestureDetector(
                            onTap: () {
                              ref.read(indexTestWindow.notifier).state =
                                  int.parse(testlashUchun.listSubjectInfo[i]
                                          .scienceIndexValue) +
                                      index2;
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 45,
                                height: 50,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: testlashUchun
                                                .list[(int.parse(testlashUchun
                                                        .listSubjectInfo[i]
                                                        .scienceIndexValue) +
                                                    index2)]
                                                .userAns !=
                                            "-"
                                        ? ColorsApp.colorWhiteBlue
                                        : ColorsApp.colorWhiteTitle,
                                    border: Border.all(
                                        color: testlashUchun
                                                    .list[(int.parse(testlashUchun
                                                            .listSubjectInfo[i]
                                                            .scienceIndexValue) +
                                                        index2)]
                                                    .userAns ==
                                                "-"
                                            ? Colors.black
                                            : Colors.grey,
                                        width: 1)),
                                child: Center(
                                    child: Text(
                                  "${(int.parse(testlashUchun.listSubjectInfo[i].scienceIndexValue) + index2 + 1)} ${testlashUchun.list[(int.parse(testlashUchun.listSubjectInfo[i].scienceIndexValue) + index2)].userAns != "-" ? "/ ${TestlashUchun.listVariant[int.parse(testlashUchun.list[(int.parse(testlashUchun.listSubjectInfo[i].scienceIndexValue) + index2)].userAns)]}" : ""}",
                                  style: TextStyle(
                                      color: testlashUchun
                                                  .list[(int.parse(testlashUchun
                                                          .listSubjectInfo[i]
                                                          .scienceIndexValue) +
                                                      index2)]
                                                  .userAns ==
                                              "-"
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ));
}

endExam({required BuildContext context , required TestlashUchun testlashUchun }) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            contentPadding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            title: const Align(
                alignment: Alignment.center, child: Text("Test app")),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
            content: SizedBox(
                height: 105,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Center(
                    child: Column(
                  children: [
                    const Text(
                      "Testni yakunlash ?",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                getScore(context: context, testlashUchun: testlashUchun);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: const Text("Xa"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: const Text("Yoq"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
          ));
}



getScore({required BuildContext context, required TestlashUchun testlashUchun}) {
    int natija = 0;

  log(jsonEncode(testlashUchun.listAnswer));
  log(jsonEncode(testlashUchun.userAnswer));
  for (int i = 0; i < 15; i++) {
    if (testlashUchun.listAnswer[i] ==
        testlashUchun.userAnswer[i]) {
      natija += 1;
    } else {}
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            contentPadding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            title: const Align(
                alignment: Alignment.center, child: Text("Test app")),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
            content: SizedBox(
                height: 105,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      "$natija ta to'g'ri javob",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child:  Text("Tanishdim", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),),
                    ),
                  ],
                ))),
          ));
}

double getHeight(double h, int countQuestion) {
  if (h > 1000) {
    return countQuestion * 50 + 10;
  } else if (h > 900 && h < 1000) {
    return countQuestion * 24 + 10;
  } else {
    return countQuestion * 21 + 10;
  }
}
