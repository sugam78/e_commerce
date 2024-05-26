import 'package:e_commerce/Resources/Theme/app_pallete.dart';
import 'package:flutter/material.dart';

class ReusuableButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onTap;
  final double height, width;
  final Color color;
  const ReusuableButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height = 55,
      this.width = double.infinity,
      this.color = AppPallete.gradient1,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(title),
        ),
      ),
    );
  }
}
