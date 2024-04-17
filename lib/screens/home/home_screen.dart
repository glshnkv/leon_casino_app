import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leon_casino_app/router/router.dart';
import 'package:leon_casino_app/screens/home/widgets/game_button.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGrey,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        centerTitle: true,
        title: Text(
          'Leon',
          style: AppStyles.Bold16(AppColors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: AppColors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/home/banner.png'),
                GameButton(
                  name: 'Wheel of Fortune',
                  buttonPath: 'assets/images/home/button-1.png',
                  onTap: () {
                    context.router.push(WheelsListRoute());
                  },
                ),
                GameButton(
                  name: 'Random Number',
                  buttonPath: 'assets/images/home/button-2.png',
                  onTap: () {
                    context.router.push(RandomNumberGameRoute());
                  },
                ),
                GameButton(
                  name: 'Magic 8 Ball',
                  buttonPath: 'assets/images/home/button-3.png',
                  onTap: () {
                    context.router.push(MagicBallGameRoute());
                  },
                ),
                GameButton(
                  name: 'Simple Yes or No',
                  buttonPath: 'assets/images/home/button-4.png',
                  onTap: () {
                    context.router.push(YesOrNoGameRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
