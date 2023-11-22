import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class AwenserWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;
  const AwenserWidget({Key? key, required this.title, this.isRight = false, this.isSelected = false}) : super(key: key);

  
  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.lightGreen : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? _selectedBorderCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border))
          ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title, 
                  style: isSelected
                              ? _selectedTextStyleRight
                              : AppTextStyles.body,
                    ),
                  ),
                
            Container(
              width: 24,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                            ? _selectedColorRight
                            : AppColors.lightGreen,
                borderRadius: BorderRadius.circular(500),
                border: Border.fromBorderSide(BorderSide(color: AppColors.border))
              ),
              child: isSelected 
              ? Icon(
                  Icons.check,
                size: 16,
                color: Colors.white,
                )
                :null,
            )
                
                
          ]),
        ),
      ),
    );
  }
}