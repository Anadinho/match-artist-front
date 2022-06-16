import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'custom_colors.dart';

class TextFildFormPatters extends StatefulWidget {
  TextFildFormPatters(
      {required this.label,
      required this.iconLabel,
      required this.controller,
      this.obscureText});
  final bool? obscureText;
  final String label;
  final IconData iconLabel;
  final TextEditingController controller;

  @override
  State<TextFildFormPatters> createState() => _TextFildFormPattersState();
}

class _TextFildFormPattersState extends State<TextFildFormPatters> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: CustomColors().getWordColor()),
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: CustomColors().getWordColor()),
        prefixIcon: Icon(
          widget.iconLabel,
          color: CustomColors().getWordColor(),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: CustomColors().getWordColor(),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: CustomColors().getWordColor(),
          ),
        ),
      ),
    );
  }
}
