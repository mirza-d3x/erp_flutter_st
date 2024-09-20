import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets/icon_assets.dart';
import '../../constants/theme/styles.dart';

class CustomDropdownPicker extends StatefulWidget {
  final String? selectedValue;
  final List<String> items;
  final String placeholder;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onChanged;
  final double width;

  const CustomDropdownPicker({
    super.key,
    this.selectedValue,
    required this.items,
    this.placeholder = 'Select an option',
    this.validator,
    this.onChanged,
    this.width = 90,
  });

  @override
  CustomDropdownPickerState createState() => CustomDropdownPickerState();
}

class CustomDropdownPickerState extends State<CustomDropdownPicker> {
  String? _errorText;

  String? _validate(String? value) {
    setState(() {
      _errorText = widget.validator?.call(value);
    });
    return _errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: _errorText != null ? Colors.red : customColors().grey300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: DropdownButtonFormField<String?>(
            value: widget.items.contains(widget.selectedValue)
                ? widget.selectedValue
                : null,
            onChanged: (value) {
              _validate(value);
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            icon: Image.asset(
              AssetIcons.dropDown,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              border: InputBorder.none,
              labelStyle: customTextStyle(
                fontStyle: FontStyle.bodyLarge,
                color: FontColor.grey600,
              ),
              errorText: '',
              errorStyle: const TextStyle(height: 0.1, fontSize: 0),
            ),
            items: [
              DropdownMenuItem<String?>(
                value: null,
                child: Text(
                  widget.placeholder,
                  style: customTextStyle(
                    fontStyle: FontStyle.bodyLarge,
                    color: FontColor.grey600,
                  ),
                ),
              ),
              ...widget.items.map(
                (item) {
                  return DropdownMenuItem<String?>(
                    value: item,
                    child: SizedBox(
                      width: widget.width.w,
                      child: Text(
                        item,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: customTextStyle(
                          fontStyle: FontStyle.bodyLarge,
                          color: FontColor.grey600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
            validator: _validate,
          ),
        ),
        if (_errorText != null) ...[
          SizedBox(height: 8.h),
          Text(
            _errorText!,
            style: TextStyle(
              color: Colors.red,
              fontSize: 12.sp,
              fontFamily: 'Nato Sans',
            ),
          ),
        ],
      ],
    );
  }
}
