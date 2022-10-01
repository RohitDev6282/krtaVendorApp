import 'package:flutter/material.dart';
import 'package:krta_vendor_app/constant/constant.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String hinttest;
  var validiate;
  final TextEditingController controller;

  // final ValueChanged<String> onChanged;

  TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.hinttest,
    this.validiate,
    required this.label,
    required this.controller,
    // required this.onChanged,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
          ),
          const SizedBox(height: 5),
          TextFormField(
            validator: widget.validiate,
            controller: widget.controller,
            style: kLargeTextStyle,
            decoration: InputDecoration(
              hintText: widget.hinttest,
              hintStyle: kExMediumTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: widget.maxLines,
          ),
        ],
      );
}
