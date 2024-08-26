import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sizeH = Provider.family<double, BuildContext>((ref, context) {
  double h = MediaQuery.of(context).size.height;
  if (h > 1000) {
    return h * 1.2;
  } else if (1000 > h && h > 900) {
    return h * 0.85;
  } else if (900 >= h && h >= 800) {
    return h * 0.9;
  } else {
    return h * 0.5;
  }
});

final sizeW = Provider.family<double, BuildContext>((ref, context) {
  double w = MediaQuery.of(context).size.width;
  if (w > 1000) {
    return w * 0.5;
  } else if (1000 >= w && w >= 900) {
    return w * 0.4;
  } else if (900 >= w && w >= 800) {
    return w * 0.8;
  } else {
    return w * 0.5;
  }
});
