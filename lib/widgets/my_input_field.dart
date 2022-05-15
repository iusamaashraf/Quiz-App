import 'package:flutter/material.dart';
import 'package:quiz_app/utils/size_config.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.textInputType,
    required this.validator,
    this.isObsure = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final String? Function(String? val)? validator;
  final bool isObsure;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6 * SizeConfig.heightMultiplier,
      width: 100 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          obscureText: isObsure,
          validator: validator,
          keyboardType: TextInputType.emailAddress,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
