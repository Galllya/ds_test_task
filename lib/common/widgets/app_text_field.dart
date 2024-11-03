import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;
  final bool isPhoneNumber;
  final bool isValid;
  final bool isEmail;
  final bool textInputActionNext;
  final bool isDate;
  final bool isNumber;
  const AppTextField({
    super.key,
    required this.controller,
    required this.lableText,
    this.isPhoneNumber = false,
    this.isValid = true,
    this.isEmail = false,
    this.textInputActionNext = true,
    this.isDate = false,
    this.isNumber = false,
  });

  TextInputType? _getTextInputType() {
    if (isEmail) return TextInputType.emailAddress;
    if (isPhoneNumber || isDate || isNumber) return TextInputType.number;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [
        if (isPhoneNumber)
          MaskTextInputFormatter(
            mask: '+7 (###) ###-####',
            type: MaskAutoCompletionType.eager,
          ),
        if (isDate)
          MaskTextInputFormatter(
            mask: '##.##.####',
            type: MaskAutoCompletionType.eager,
          ),
      ],
      textInputAction:
          textInputActionNext ? TextInputAction.next : TextInputAction.done,
      keyboardType: _getTextInputType(),
      decoration: InputDecoration(
        labelText: lableText,
        filled: true,
        fillColor: isValid ? AppColors.inputValid : AppColors.inputNotValid,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
