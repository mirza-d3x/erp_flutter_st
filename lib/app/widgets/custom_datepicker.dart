import 'package:erp_mobile/constants/assets/icon_assets.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final String labelText;
  final String? initialDate;
  final ValueChanged<String?>? onDateSelected;
  final String? Function(String?)? validator;

  const CustomDatePicker({
    super.key,
    required this.labelText,
    this.initialDate,
    this.onDateSelected,
    this.validator,
  });

  @override
  CustomDatePickerState createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  String? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate != null
          ? DateTime.tryParse(widget.initialDate!)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Change this to match your app's theme
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null &&
        _selectedDate != selectedDate.toIso8601String()) {
      setState(() {
        _selectedDate = selectedDate.toIso8601String();
        // Notify the parent widget about the selected date
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(_selectedDate);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: _selectedDate ?? widget.initialDate,
      validator: widget.validator,
      builder: (FormFieldState<String> state) {
        return GestureDetector(
          onTap: () async {
            await _selectDate(context);
            // Update the FormField state with the new date and re-validate
            state.didChange(_selectedDate);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 56,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color:
                        state.hasError ? Colors.red : const Color(0xFFD1D5DB),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate != null
                          ? _selectedDate!
                              .split('T')[0] // Format date to 'YYYY-MM-DD'
                          : widget.labelText,
                      style: customTextStyle(
                        fontStyle: FontStyle.bodyLarge,
                        color: FontColor.grey600,
                      ),
                    ),
                    Image.asset(
                      AssetIcons.calendarIcon,
                      height: 24,
                      width: 24,
                      color: customColors().grey600,
                    ),
                  ],
                ),
              ),
              if (state.hasError) ...[
                const SizedBox(height: 8),
                Text(
                  state.errorText!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontFamily: 'Nato Sans',
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
