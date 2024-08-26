import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp1/presentation/test_ui/ui/test_working_ui.dart';

main() {
  runApp(const ProviderScope(child: FlutterTeXExample()));
}

class FlutterTeXExample extends StatelessWidget {
  const FlutterTeXExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestWorkingUi(),
    );
  }
}
