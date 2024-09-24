import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/theme/styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
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
  final String? Function(String?)? onChanged;

  const CustomTextField({
    required this.controller,
    this.labelText = 'Enter',
    this.errorText,
    this.focusedBorderColor = Colors.teal,
    this.unfocusedBorderColor = const Color(0xffD1D5DB),
    this.errorBorderColor = Colors.red,
    this.borderRadius = 4.0,
    this.borderWidth = 1.0,
    this.labelStyle = const TextStyle(color: Color(0xff4B5563), fontSize: 12),
    this.hintStyle,
    this.errorStyle,
    this.textStyle,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 12.0),
    this.obscureText = false,
    super.key,
    this.textInputType,
    this.textInputAction,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.onChanged,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _focusNode.requestFocus(),
          child: Container(
            height: 56.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                width: 1,
                color: _errorText != null
                    ? widget.errorBorderColor
                    : isFocused
                        ? widget.focusedBorderColor
                        : widget.unfocusedBorderColor,
              ),
            ),
            child: TextFormField(
              onChanged: widget.onChanged,
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
              cursorHeight: 20.h,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                filled: true,
                fillColor: Colors.white,
                hintText: widget.labelText,
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: isFocused
                      ? customColors().grey400
                      : customColors().grey600,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                errorStyle: TextStyle(
                  color: widget.errorBorderColor,
                  fontSize: 12.sp,
                  fontFamily: 'Roboto',
                ),
                contentPadding: widget.contentPadding,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                color: customColors().grey900,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
