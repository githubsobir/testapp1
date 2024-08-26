import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp1/presentation/test_ui/provider_test_ui/model_ui.dart';
import 'package:testapp1/presentation/test_ui/provider_test_ui/riverpod_test_ui.dart';

class TestlashUchun {
  int countAllQuestion = 15;
  static const int hh = 1;
  static const int mm = 00;
  static const int ss = 00;


  /// fan nomi
  static List<String> fanlarNomi = [
    // "Ona tili",
    // "O'zbekiston tarixi",
    "Matematika",
    // "Huquqshunoshlik",
    // "Chet tili"
  ];

  static List<String> listVariant = ["A", "B", "C", "D", "E"];


  List<DataFreeExams> list = [];
  List<GetKeyValues> listSubjectInfo = [];

  int subjectCounterForSort = 1;

  getQuestion(WidgetRef ref) {
    list.clear();


    try {
      for (int i = 0; i < countAllQuestion; i++) {
        ref
            .read(listColorStateProvider.notifier)
            .state
            .add(["-", "-", "-", "-", "-"]);

        list.add(DataFreeExams(
            bookNum: "",
            isFavorite: false,
            name: getFanNomi(i),
            nameQq: "",
            nameRu: "",
            orderId: 1,
            pdfUrl: "assets/images/savol${i + 1}.png",
            questionId: i + 1,
            scienceId: 1,
            svgUrl: "assets/images/savol2.png",
            userId: 123,
            userAns: "-"));
      }
      // ref.read(listUserAnswerColor.notifier).state = listColor;

      for (int j = 0; j < list.length - 1; j++) {
        if (list[j].name == list[j + 1].name) {
          subjectCounterForSort += 1;
        } else {
          listSubjectInfo.add(GetKeyValues(
              scienceName: list[j].name,
              scienceCount: subjectCounterForSort.toString(),
              scienceIndexValue: (j - subjectCounterForSort + 1).toString()));
          subjectCounterForSort = 1;
        }
        if (list[j + 1] == list[list.length - 1]) {
          listSubjectInfo.add(GetKeyValues(
              scienceName: list[j].name,
              scienceCount: subjectCounterForSort.toString(),
              scienceIndexValue: (j - subjectCounterForSort + 2).toString()));
        }
      }
      log("listSubjectInfo  ${jsonEncode(listSubjectInfo)}");
      // log("listSubjectInfo length ${list[int.parse(listSubjectInfo[listSubjectInfo.length - 1].scienceIndexValue)].name}");
    } catch (e) {
      log(e.toString());
    }
  }

  static String getFanNomi(int index) {
    if (index < 15) {
      return fanlarNomi[0];
    } else if (index >= 10 && index <= 19) {
      return fanlarNomi[1];
    } else if (index >= 20 && index <= 29) {
      return fanlarNomi[2];
    } else if (index >= 30 && index <= 59) {
      return fanlarNomi[3];
    } else if (index >= 60 && index < 90) {
      return fanlarNomi[4];
    }
    return "";
  }
  List<String> listAnswer = [
    "0", //1 "A"
    "0",//2 "A"
    "0",//3 "A"
    "4",//4 "E"
    "3",//5 "D"
    "0",//6 "A"
    "0",//7 "A"
    "1",//8 "B"
    "1",//9 "B"
    "2",//10 "C"
    "2",//11 "C"
    "4",//12 "E"
    "0",//13 "A"
    "2",//14 "C"
    "3",//15 "D"
  ];

  List<String> userAnswer = [
    "", //1 "A"
    "",//2 "A"
    "",//3 "A"
    "",//4 "E"
    "",//5 "D"
    "",//6 "A"
    "",//7 "A"
    "",//8 "B"
    "",//9 "B"
    "",//10 "C"
    "",//11 "C"
    "",//12 "E"
    "",//13 "A"
    "",//14 "C"
    ""//15 "D"
  ];



}

class GetKeyValues {
  String scienceName;
  String scienceCount;
  String scienceIndexValue;

  GetKeyValues({
    required this.scienceName,
    required this.scienceCount,
    required this.scienceIndexValue,
  });

  factory GetKeyValues.fromJson(Map<String, dynamic> json) => GetKeyValues(
      scienceName: "scienceName",
      scienceCount: "scienceCount",
      scienceIndexValue: "scienceIndexValue");

  Map<String, String> toJson() => {
        "scienceName": scienceName,
        "scienceCount": scienceCount,
        "scienceIndexValue": scienceIndexValue
      };
}
