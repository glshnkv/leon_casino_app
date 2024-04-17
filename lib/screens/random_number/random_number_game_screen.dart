import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';
import 'package:leon_casino_app/widgets/action_button_widgets.dart';

@RoutePage()
class RandomNumberGameScreen extends StatefulWidget {
  const RandomNumberGameScreen({super.key});

  @override
  State<RandomNumberGameScreen> createState() => _RandomNumberGameScreenState();
}

class _RandomNumberGameScreenState extends State<RandomNumberGameScreen> {
  int _randomNumber = 0;
  double _upperLimit = 100;

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = Random().nextInt(_upperLimit.toInt()) + 1;
    });
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
          'Leon Numbers',
          style: AppStyles.Bold16(AppColors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Generate random number',
              style: AppStyles.ExtraBold22(AppColors.white),
            ),
            Text(
              '$_randomNumber',
              textAlign: TextAlign.center,
              style: AppStyles.ExtraBold44(AppColors.green),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'from 1',
                        style: AppStyles.News14(AppColors.white),
                      ),
                      Text(
                        'from ${_upperLimit.toInt()}',
                        style: AppStyles.News14(AppColors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.fieldGrey,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Slider(
                      thumbColor: AppColors.white,
                      activeColor: AppColors.green,
                      value: _upperLimit,
                      min: 1,
                      max: 100,
                      divisions: 100,
                      label: _upperLimit.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _upperLimit = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ActionButtonWidget(text: 'Generate', width: 250, onTap: _generateRandomNumber)
          ],
        ),
      ),
    );
  }
}
