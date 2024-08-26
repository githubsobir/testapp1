import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp1/core/color_test_ui.dart';
import 'package:testapp1/core/size_prosent.dart';
import 'package:testapp1/presentation/test_ui/provider_test_ui/riverpod_test_ui.dart';
import 'package:testapp1/presentation/test_ui/ui/app_bar_ui.dart';
import 'package:testapp1/presentation/test_ui/ui/drawer.dart';
import 'package:testapp1/presentation/test_ui/ui/drawing/drawing.dart';
import 'package:testapp1/presentation/test_ui/ui/select_variants.dart';
import 'package:testapp1/testlash_string.dart';

class TestWorkingUi extends ConsumerStatefulWidget {
  const TestWorkingUi({super.key});

  @override
  ConsumerState<TestWorkingUi> createState() => _TestWorkingUiState();
}

class _TestWorkingUiState extends ConsumerState<TestWorkingUi> {
  TestlashUchun testlashUchun = TestlashUchun();

  @override
  void initState() {
    testlashUchun.getQuestion(ref);
    super.initState();
  }

  int fanNomId = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBarUi(testlashUchun.list[0].bookNum),
          drawer: drawerUi(testlashUchun, MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width, context),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showFanName();
                        },
                        child: Container(
                            height: 70,
                            width: ref.read(sizeW(context)) * 0.65,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      offset: Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  testlashUchun
                                      .list[ref.watch(indexTestWindow)].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ))),
                      ),
                      SizedBox(
                        height: ref.read(sizeH(context)),
                        child: ListView.builder(
                            // gridDelegate:
                            //     const SliverGridDelegateWithFixedCrossAxisCount(
                            //         crossAxisCount: 1),
                            itemCount: testlashUchun.list.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              fanNomId = index;
                              return GestureDetector(
                                onHorizontalDragEnd: (DragEndDetails details) {
                                  // Swiping in right direction.
                                  if (details.primaryVelocity! > 0) {
                                    getIndex("+");
                                  }
                                  // Swiping in left direction.
                                  if (details.primaryVelocity! < 0) {
                                    getIndex("-");
                                  }
                                },
                                onVerticalDragEnd: (DragEndDetails details) {
                                  // Swiping in right direction.

                                  if (details.primaryVelocity! > 0) {
                                    getIndex("+");
                                  }
                                  // Swiping in left direction.
                                  if (details.primaryVelocity! < 0) {
                                    getIndex("-");
                                  }
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: ref.read(sizeH(context)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: ColorsApp.colorWhiteBlue,
                                                shape: BoxShape.circle),
                                            margin: const EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              (ref.watch(indexTestWindow) + 1)
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                ref.read(sizeH(context)) * 0.55,
                                            width:
                                                300,
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Image(
                                                height:   ref.read(sizeH(context)) * 0.55,
                                                width:
                                                300,
                                                image: AssetImage(testlashUchun
                                                    .list[ref
                                                        .watch(indexTestWindow)]
                                                    .pdfUrl,


                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          margin:
                                              const EdgeInsets.only(right: 30),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: const [
                                                BoxShadow(
                                                    blurRadius: 0.1,
                                                    spreadRadius: 0.1,
                                                    color: Colors.grey),
                                              ],
                                              color: Colors.white),
                                          child: const Center(
                                            child: Text(
                                              "Savolda xatolik topdim",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      /// list select variants
                                      selectButtons(
                                          ref, context, testlashUchun),
                                      const SizedBox(height: 30),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                const DrawingUI()
              ])),
        ));
  }




   showFanName(){
    return  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))),
      builder: (context) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: testlashUchun.listSubjectInfo.length,
          itemBuilder: (context, index2) =>
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);

                },
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey, width: 1))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(testlashUchun.listSubjectInfo[index2].scienceName,style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
  }

  getIndex(String val) {
    ref.read(indexUserAnswer.notifier).state = 99;

    if (val == "-") {
      if (ref.watch(indexTestWindow) < testlashUchun.list.length - 1) {
        ref.read(indexTestWindow.notifier).state =
            ref.watch(indexTestWindow) + 1;
      }
    } else {
      if (ref.watch(indexTestWindow) > 0) {
        ref.read(indexTestWindow.notifier).state =
            ref.watch(indexTestWindow) - 1;
      }
    }
    return ref.watch(indexTestWindow);
  }
}
