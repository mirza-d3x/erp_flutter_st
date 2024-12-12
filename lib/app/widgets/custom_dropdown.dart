import 'package:flutter/material.dart';
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
    return Container(
      height: 56,
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
        icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          labelText: widget.placeholder,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: InputBorder.none,
          labelStyle: customTextStyle(
            fontStyle: FontStyle.bodySmall,
            color: FontColor.grey900,
          ),
          errorText: '',
          errorStyle: const TextStyle(height: 0.1, fontSize: 0),
        ),
        items: widget.items.map((item) {
          return DropdownMenuItem<String?>(
            value: item,
            child: Text(
              item,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: customColors().grey900,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
          );
        }).toList(),
        validator: _validate,
      ),
    );
  }
}
