import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'custom_colors.dart';

class InputDecortionPatters extends StatefulWidget {
  const InputDecortionPatters({required this.label, required this.iconLabel});

  final String label;
  final IconData iconLabel;

  @override
  State<InputDecortionPatters> createState() => _InputDecortionPattersState();
}

class _InputDecortionPattersState extends State<InputDecortionPatters> {
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
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
