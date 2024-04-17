import 'package:flutter/material.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key,
      required this.text,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.green,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Center(
          child: Text(
            text,
            style: AppStyles.ExtraBold22(
              AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
