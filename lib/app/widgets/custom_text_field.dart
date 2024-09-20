import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.labelText = 'First Name',
    this.placeholderText = 'Enter First Name',
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
    this.contentPadding = const EdgeInsets.symmetric(vertical: 12.0),
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
  double _containerHeight = 56.h;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = widget.controller;
    _focusNode.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateHeight();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _updateHeight() {
    final textHeight = _calculateTextHeight(_controller.text);
    setState(() {
      if (widget.maxLines == 1) {
        _containerHeight = 56.h;
      } else {
        _containerHeight = textHeight > 156.h ? textHeight : 156.h;
      }
    });
  }

  double _calculateTextHeight(String text) {
    final span = TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Nato Sans',
      ),
    );
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: widget.maxLines,
    );
    painter.layout(maxWidth: MediaQuery.of(context).size.width - 32.w);
    return painter.size.height + (widget.contentPadding?.vertical ?? 0.0);
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _containerHeight,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: isFocused || _controller.text.isNotEmpty
                      ? Text(
                          widget.labelText!,
                          key: ValueKey<bool>(isFocused),
                          style: widget.labelStyle?.copyWith(
                            color: Colors.grey[600],
                            fontSize: 12.sp,
                          ),
                        )
                      : const SizedBox.shrink(),
                  transitionBuilder: (child, animation) {
                    var offsetTween = Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    );
                    var curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    );
                    final offsetAnimation =
                        offsetTween.animate(curvedAnimation);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: TextFormField(
                    validator: _validate,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    keyboardType: widget.textInputType ?? TextInputType.name,
                    textInputAction:
                        widget.textInputAction ?? TextInputAction.next,
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
                      hintText:
                          isFocused ? widget.placeholderText : widget.labelText,
                      hintStyle: TextStyle(
                        fontFamily: 'Nato Sans',
                        color: isFocused
                            ? customColors().grey400
                            : customColors().grey600,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      errorText: "",
                      errorStyle: const TextStyle(height: 0.1, fontSize: 0),
                      contentPadding: widget.contentPadding,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      color: customColors().grey900,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Nato Sans',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_errorText != null) ...[
          SizedBox(height: 8.h),
          Text(
            _errorText!,
            style: widget.errorStyle ??
                TextStyle(
                  color: widget.errorBorderColor,
                  fontSize: 12.sp,
                  fontFamily: 'Nato Sans',
                ),
          ),
        ],
      ],
    );
  }
}
