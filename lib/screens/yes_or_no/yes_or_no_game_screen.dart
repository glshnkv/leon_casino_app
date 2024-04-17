import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';
import 'package:leon_casino_app/widgets/action_button_widgets.dart';

@RoutePage()
class YesOrNoGameScreen extends StatefulWidget {
  const YesOrNoGameScreen({super.key});

  @override
  State<YesOrNoGameScreen> createState() => _YesOrNoGameScreenState();
}

class _YesOrNoGameScreenState extends State<YesOrNoGameScreen> {
  double _height1 = 10;
  double _height2 = 10;

  void _generateHeights() {
    setState(() {
      _height1 = Random().nextDouble() * 100 + 10;
      _height2 = Random().nextDouble() * 100 + 10;
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
        title: Text('Leon Simply Yes Or No', style: AppStyles.Bold16(AppColors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Yes or No?', style: AppStyles.ExtraBold22(AppColors.white),),
            SizedBox(height: 270,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            color: AppColors.orange,
                          ),
                          width: 75,
                          height: _height1 * 2,
                        ),
                        SizedBox(height: 10),
                        Text('No', style: AppStyles.ExtraBold22(AppColors.orange),),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            color: AppColors.green,
                          ),
                          width: 75,
                          height: _height2 * 2,
                        ),
                        SizedBox(height: 10),
                        Text('Yes', style: AppStyles.ExtraBold22(AppColors.green),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ActionButtonWidget(text: 'Generate', width: 250, onTap: _generateHeights)
          ],
        ),
      ),
    );
  }
}
