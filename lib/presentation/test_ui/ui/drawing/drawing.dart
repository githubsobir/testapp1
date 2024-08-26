import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:flutter_drawing_board/paint_contents.dart';
import 'package:flutter_drawing_board/path_steps.dart';

class DrawingUI extends StatefulWidget {
  const DrawingUI({super.key});

  @override
  State<DrawingUI> createState() => _DrawingState();
}

class _DrawingState extends State<DrawingUI> {
  // final DrawingController _drawingController = DrawingController();
  List<DrawingController> drawingController = [];
var colors = Colors.black;
  getImageData() {
    // print((await _drawingController.getImageData()).buffer.asInt8List());
    for (int i = 0; i < 30; i++) {
      drawingController.add(DrawingController(
        content: SimpleLine.data(path:DrawPath() , paint: Paint()
        ..color = Colors.black
            ..strokeWidth = 0.2


        ),

      ));
    }
    drawingController[0].drawing(const Offset(1, 1));
  }

  @override
  void initState() {
    getImageData();
    super.initState();
  }

  bool boolScrollList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                boolScrollList = !boolScrollList;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(boolScrollList ? Icons.lock_open : Icons.lock),
            ),
          ),
        ],
      ),
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 30,
          physics: boolScrollList
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DrawingBoard(


                    controller: drawingController[index],
                    maxScale: 0.4,
                    background: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.9,
                        color: Colors.white),
                    showDefaultActions: true,

                  ),

                  /// Get drawing board data
                ),
                const Image(
                  image: AssetImage("assets/images/savol2.png"),
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
