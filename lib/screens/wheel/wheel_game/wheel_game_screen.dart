import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:leon_casino_app/models/wheel_model.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';
import 'package:leon_casino_app/widgets/action_button_widgets.dart';

@RoutePage()
class WheelGameScreen extends StatefulWidget {
  final WheelModel wheel;

  const WheelGameScreen({super.key, required this.wheel});

  @override
  State<WheelGameScreen> createState() => _WheelGameScreenState();
}

class _WheelGameScreenState extends State<WheelGameScreen> {
  StreamController<int> controller = StreamController<int>();

  List<Color> colors = [
    AppColors.purple,
    AppColors.red,
    AppColors.yellow,
    AppColors.blue
  ];

  int resultIndex = 0;
  String spinResult = '';

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          'Leon Spin',
          style: AppStyles.Bold16(AppColors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Spin to know ${widget.wheel.question}',
                  style: AppStyles.ExtraBold22(AppColors.white),
                ),
                Text(
                  '$spinResult',
                  style: AppStyles.ExtraBold22(AppColors.green),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: AppColors.green,),
                  borderRadius: BorderRadius.all(Radius.circular(1000.0))),
              width: 300,
              height: 300,
              child: FortuneWheel(
                physics: NoPanPhysics(),
                animateFirst: false,
                selected: controller.stream,
                items: [
                  for (var option in widget.wheel.options)
                    FortuneItem(
                      child: Text(option, style: AppStyles.Bold16(AppColors.white)),
                      style: FortuneItemStyle(
                        color: colors[Random().nextInt(colors.length)],
                        borderColor: AppColors.white,
                        borderWidth: 3,
                      ),
                    ),
                ],
                indicators: <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.center,
                    child: Image.asset(
                        'assets/images/elements/indicator.png'),
                  ),
                ],
                onAnimationStart: () {
                  setState(() {
                    spinResult = '';
                  });
                },
                onAnimationEnd: () {
                  setState(() {
                    spinResult = widget.wheel.options[resultIndex];
                  });
                },
              ),
            ),
            ActionButtonWidget(
                text: 'SPIN',
                width: 250,
                onTap: () {
                  resultIndex =
                      Fortune.randomInt(0, widget.wheel.options.length);
                  controller.add(resultIndex);
                })
          ],
        ),
      ),
    );
  }
}
