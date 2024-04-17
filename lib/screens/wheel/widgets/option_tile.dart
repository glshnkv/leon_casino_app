import 'package:flutter/material.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

class OptionTile extends StatelessWidget {
  final String option;
  final void Function()? onPressed;

  const OptionTile({super.key, required this.option, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.fieldGrey,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(option, style: AppStyles.News16(AppColors.white)),
          IconButton(onPressed: onPressed, icon: Icon(Icons.delete, color: AppColors.orange)),
        ],
      ),
    );
  }
}
