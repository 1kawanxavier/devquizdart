import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;
  const NextButtonWidget({required this.label, required this.backgroundColor, required this.fontColor, required this.borderColor, required this.onTap});

  @override


  NextButtonWidget.green({required String label, required VoidCallback onTap,}): this.backgroundColor = AppColors.darkGreen, this.fontColor = AppColors.white, this.label = label, this.borderColor =  AppColors.green,  this.onTap = onTap;

  NextButtonWidget.purple({required String label, required VoidCallback onTap,}): this.backgroundColor = AppColors.purple, this.fontColor = AppColors.white, this.label = label, this.borderColor =  AppColors.green,  this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap}): this.backgroundColor = AppColors.white, this.fontColor = AppColors.grey, this.label = label, this.borderColor = AppColors.border, this.onTap = onTap;



  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            side: MaterialStateProperty.all(BorderSide(color: borderColor))
          ),
          onPressed: onTap, 
          child: Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),),
          
          
          ),
      
      ); 
  }
}