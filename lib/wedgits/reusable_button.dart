import 'package:flutter/material.dart';
import 'package:proctorialboard/wedgits/reusable_text.dart';

import '../themes/color.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final Color buttonColor;
  const ReusableButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.buttonColor = AppColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: buttonColor),
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColor.redColor,
              )
            : ReusableText(
                title: title,
                size: 16,
                weight: FontWeight.w700,
                color: AppColor.whiteColor,
              ),
      ),
    );
  }
}
