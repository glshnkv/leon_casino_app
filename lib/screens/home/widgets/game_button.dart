import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

class GameButton extends StatelessWidget {
  final String name;
  final String buttonPath;
  final void Function()? onTap;

  const GameButton({super.key, required this.name, required this.buttonPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 358,
        height: 117,
        child: Stack(
          children: [
            Image.asset(buttonPath),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: AppStyles.ExtraBold22(AppColors.white),),
                  SvgPicture.asset('assets/images/elements/play.svg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
