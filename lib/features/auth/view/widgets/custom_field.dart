import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  const CustomField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText: hintText));
  }
}
