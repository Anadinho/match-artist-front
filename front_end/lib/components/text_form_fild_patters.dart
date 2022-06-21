import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

import 'custom_colors.dart';

class TextFildFormPatters extends StatefulWidget {
  TextFildFormPatters(
      {required this.label,
      required this.iconLabel,
      this.controller,
      this.obscureText,
      this.validator,
      this.imputFormat});
  final List<TextInputFormatter>? imputFormat;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final String label;
  final IconData iconLabel;
  final TextEditingController? controller;

  @override
  State<TextFildFormPatters> createState() => _TextFildFormPattersState();
}

class _TextFildFormPattersState extends State<TextFildFormPatters> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: CustomColors().getWordColor()),
      obscureText: widget.obscureText ?? false,
      controller: widget.controller ?? null,
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
          focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 2, color: Color.fromARGB(255, 3, 37, 53))),
          errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: 3, color: Color.fromARGB(255, 3, 37, 53))),
          errorStyle: TextStyle(
              color: Color.fromARGB(255, 3, 37, 53),
              fontSize: 15,
              fontWeight: FontWeight.bold)),
      validator: widget.validator ??
          Validatorless.required('${widget.label} Obrigatorio'),
      inputFormatters: widget.imputFormat,
    );
  }
}
