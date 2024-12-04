import 'package:flutter/material.dart';

import '../../constants/theme/styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? placeholderText;
  final String? errorText;
  final String? initialValue; // Optional initial value
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
  final Function()? onEditingComplete;
  final FocusNode? focusNode; // Optional FocusNode

  const CustomTextField({
    required this.controller,
    this.labelText = ' ',
    this.placeholderText = ' ',
    this.errorText,
    this.initialValue, // Add the optional initial value
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
    this.onEditingComplete,
    this.focusNode, // Optional parameter
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
    _controller = widget.controller;

    // Set initial value if provided
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }

    // Use provided FocusNode if available, otherwise create a new one
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose the FocusNode only if it was created internally
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: TextFormField(
          onEditingComplete: widget.onEditingComplete,
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
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            fillColor: Colors.white,
            hintText: widget.labelText,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
            hintStyle: TextStyle(
              fontFamily: 'Nato Sans',
              color:
                  isFocused ? customColors().grey400 : customColors().grey600,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            errorText: _errorText != null ? '' : null,
            errorStyle: const TextStyle(height: 0.1, fontSize: 0),
            contentPadding: widget.contentPadding,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.unfocusedBorderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.focusedBorderColor,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.errorBorderColor,
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
