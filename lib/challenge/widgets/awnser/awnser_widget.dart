import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwenserWidget extends StatelessWidget {
  final AwnserModel awenser;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final bool disabled;

  const AwenserWidget({Key? key, required this.awenser, this.isSelected = false, required this.onTap, this.disabled = false }) : super(key: key);

  
  Color get _selectedColorRight =>
      awenser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      awenser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      awenser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      awenser.isRight ? AppColors.lightGreen : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      awenser.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => awenser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: (){
            onTap(awenser.isRight);
          },
          child: Container(
            height: 70,
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
                      awenser.title, 
                      style: isSelected
                                  ? _selectedTextStyleRight
                                  : AppTextStyles.body,
                        ),
                      ),
                    
                Container(
                  width: 24,
                  height: 26,
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
        ),
      ),
    );
  }
}