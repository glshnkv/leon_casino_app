import 'package:flutter/material.dart';
import 'package:leon_casino_app/theme/colors.dart';
import 'package:leon_casino_app/theme/textstyles.dart';

class AddOptionsButton extends StatelessWidget {
  final void Function()? onTap;

  const AddOptionsButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.green,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_box_outlined, color: AppColors.white,),
              SizedBox(width: 5),
              Text(
                'Add options',
                style: AppStyles.Bold16(
                  AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
