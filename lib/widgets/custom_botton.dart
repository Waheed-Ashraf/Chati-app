import 'package:chati_app/constants.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  CustomBotton({required this.text, required this.ontap});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: ColorPallet.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            // fontFamily: 'SeymourOne',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
