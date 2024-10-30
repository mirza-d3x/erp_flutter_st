import 'package:flutter/material.dart';

import '../../constants/theme/styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? placeholderText;
  final String? errorText;
  final Color focusedBorderColor;
  final Color unfocusedBorderColor;
  final Color errorBorderColor;
  final double borderRadius;
  final double borderWidth;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;

  const CustomTextField({
    required this.controller,
    this.labelText = ' ',
    this.placeholderText = ' ',
    this.errorText,
    this.focusedBorderColor = Colors.teal,
    this.unfocusedBorderColor = const Color(0xffD1D5DB),
    this.errorBorderColor = Colors.red,
    this.borderRadius = 4.0,
    this.borderWidth = 1.0,
    this.labelStyle = const TextStyle(color: Color(0xff4B5563)),
    this.hintStyle,
    this.errorStyle,
    this.textStyle,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
    this.obscureText = false,
    super.key,
    this.textInputType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller;
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    setState(() {
      _errorText = widget.validator?.call(_controller.text);
    });
    return _errorText;
  }

  @override
  Widget build(BuildContext context) {
    bool isFocused = _focusNode.hasFocus;
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Container(
        height: 56,
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          // border: Border.all(
          //   width: 1,
          //   color: _errorText != null
          //       ? widget.errorBorderColor // Red when there is an error
          //       : isFocused
          //           ? widget.focusedBorderColor // Blue when focused
          //           : widget.unfocusedBorderColor, // Grey when unfocused
          // ),
        ),
        child: TextFormField(
          validator: _validate,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          keyboardType: widget.textInputType ?? TextInputType.name,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          cursorColor: widget.focusedBorderColor,
          cursorErrorColor: widget.errorBorderColor,
          controller: _controller,
          obscureText: widget.obscureText,
          focusNode: _focusNode,
          cursorHeight: 20,
          cursorOpacityAnimates: true,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.white,
            hintText: 'Enter ${widget.labelText}',
            label: Text(widget.labelText ?? ''), labelStyle: widget.labelStyle,
            hintStyle: TextStyle(
              fontFamily: 'Nato Sans',
              color:
                  isFocused ? customColors().grey400 : customColors().grey600,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            errorText: _errorText != null
                ? ''
                : null, // Prevents rendering error text in case of error
            errorStyle: const TextStyle(height: 0.1, fontSize: 0),
            contentPadding: widget.contentPadding,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.unfocusedBorderColor, // Grey when unfocused
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.focusedBorderColor, // Blue when focused
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.errorBorderColor, // Red when there is an error
                width: 2.0,
              ),
            ),
          ),
          style: TextStyle(
            color: customColors().grey900,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Nato Sans',
          ),
        ),
      ),
    );
  }
}
