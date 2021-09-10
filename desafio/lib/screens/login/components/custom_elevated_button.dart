import 'package:desafio/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.labelColor,
      this.buttonColor,
      this.borderSide})
      : super(key: key);
  final void Function()? onPressed;
  final String label;
  final Color? labelColor;
  final Color? buttonColor;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor ?? AppColors.secondary,
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: labelColor ?? AppColors.primary),
        ),
      ),
    );
  }
}
