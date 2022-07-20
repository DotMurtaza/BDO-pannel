import 'package:flutter/material.dart';

class BDOinputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function validator;
  final int maxLines;
  final String label, hint;
  final Color labelcolor;
  final bool enable;
  const BDOinputField({
    Key key,
    @required this.controller,
    @required this.textInputType,
    @required this.validator,
    @required this.maxLines,
    this.labelcolor,
    this.hint,
    this.label,
    this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      keyboardType: textInputType,
      controller: controller,
      enabled: enable,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
          hintText: hint,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          ))),
    );
  }
}
