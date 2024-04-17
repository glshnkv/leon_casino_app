import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';
import 'package:leon_casino_app/widgets/action_button_widgets.dart';

@RoutePage()
class MagicBallGameScreen extends StatefulWidget {
  const MagicBallGameScreen({super.key});

  @override
  State<MagicBallGameScreen> createState() => _MagicBallGameScreenState();
}

class _MagicBallGameScreenState extends State<MagicBallGameScreen> {
  final List<String> _texts = [
    'Yes',
    'No',
    'Maybe',
    'Next time',
    'Absolutely No',
    'You’re Lucky',
    'Cool!',
    'I don’t know',
    'OMG YES',
    'Wrong decision',
    'Right!',
    'That’s not',
    'Of course',
    'Sure',
    'Good Luck!',
    'Forget it',
    'You’re NOT',
    'Best decision',
    'Probably',
    'Pretty sure',
    'Hell yeah',
    'F*** it',
    'Oh no',
    'Oh yes!',
    'Wow',
    'Amazing!',
    'Go to sleep'
  ];
  String _currentText = '';

  void _generateRandomText() {
    final random = Random();
    setState(() {
      _currentText = _texts[random.nextInt(_texts.length)];
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
          'Leon Magic Ball',
          style: AppStyles.Bold16(AppColors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Get the answer',
              style: AppStyles.ExtraBold22(AppColors.white),
            ),
            SizedBox(
              height: 265,
              width: 265,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/elements/magic-ball.png'),
                  Text(
                    _currentText,
                    textAlign: TextAlign.center,
                    style: AppStyles.ExtraBold44(AppColors.green),
                  )
                ],
              ),
            ),
            ActionButtonWidget(text: 'Get Answer', width: 250, onTap: _generateRandomText)
          ],
        ),
      ),
    );
  }
}
