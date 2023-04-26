// ignore_for_file: unnecessary_string_interpolations, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String hint;
  final funValidator;
  final String? value; //널인지 아닌지 널일 수도 있으니까
  final controller;

  const CustomTextArea(
      {required this.hint,
      required this.funValidator,
      this.controller,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        maxLines: 12,
        validator: funValidator,
        decoration: InputDecoration(
          hintText: '$hint 입력',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
