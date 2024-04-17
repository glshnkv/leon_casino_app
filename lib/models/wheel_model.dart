import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'wheel_model.g.dart';

@HiveType(typeId: 0)
class WheelModel {
  @HiveField(0)
  final String question;
  @HiveField(1)
  final List<String> options;

  WheelModel(
      {required this.question, required this.options});
}