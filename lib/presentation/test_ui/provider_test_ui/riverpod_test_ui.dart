import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexTestWindow = StateProvider<int>((ref) => 0);
final indexUserAnswer = StateProvider<int>((ref) => 99);
final stateUserBall = StateProvider<int>((ref) => 0);

final listColorStateProvider = StateProvider<List<List<String>>>((ref) => []);
// final listUserAnswerColor = StateProvider.autoDispose<List<List<Color>>>((ref) => [
//      []
//     ]);
