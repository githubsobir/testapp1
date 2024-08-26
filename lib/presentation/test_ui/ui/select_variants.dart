import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp1/core/color_test_ui.dart';
import 'package:testapp1/core/size_prosent.dart';
import 'package:testapp1/presentation/test_ui/provider_test_ui/riverpod_test_ui.dart';
import 'package:testapp1/testlash_string.dart';

Widget selectButtons(
    WidgetRef ref, BuildContext context, TestlashUchun testlashUchun) {
  int userBall = 0;
  return Center(
    child: SizedBox(
      height: 55,
      width: ref.read(sizeW(context)) * 1.8,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: TestlashUchun.listVariant.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                /// user oldin belgilaganni oq qilish

                try {
                  for (int i = 0; i < TestlashUchun.listVariant.length; i++) {
                    ref
                        .read(listColorStateProvider.notifier)
                        .state[ref.watch(indexTestWindow)][i] = "-";
                  }

                  /// user belgilaganini indexini olish

                  log("indexUserAnswer old ${ref.watch(indexUserAnswer)}");
                  ref.read(indexUserAnswer.notifier).state = index;

                  log("indexUserAnswer new ${ref.watch(indexUserAnswer)}");

                  /// user belgilaganini listga joylash
                  testlashUchun.list[ref.watch(indexTestWindow)].userAns =
                      index.toString();
                  log("&&&&");
                  testlashUchun.userAnswer[ref.watch(indexTestWindow)] = index.toString();

                  /// riverpod listiga belgilab qo'yish
                  ref
                          .read(listColorStateProvider.notifier)
                          .state[ref.watch(indexTestWindow)][index] =
                      index.toString();

                  ref.read(indexUserAnswer.notifier).state = 99;
                } catch (e) {
                  log(e.toString());
                }

                log("listColorStateProvider ${ref.watch(listColorStateProvider)}");
              },
              child: Container(
                height: 35,
                width: 60,
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ref.watch(listColorStateProvider)[
                                ref.watch(indexTestWindow)][index] !=
                            "-"
                        ? ColorsApp.colorWhiteBlue
                        : Colors.white,
                    border: Border.all(color:
                    ref.watch(listColorStateProvider)[
                    ref.watch(indexTestWindow)][index] ==
                        "-"?
                    Colors.black:Colors.grey, width: 1)),
                child: Center(
                    child: Text(
                  TestlashUchun.listVariant[index],
                  style: TextStyle(
                      color: ref.watch(listColorStateProvider)[
                                  ref.watch(indexTestWindow)][index] !=
                              "-"
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold),
                )),
              ),
            );
          },
        ),
      ),
    ),
  );
}
