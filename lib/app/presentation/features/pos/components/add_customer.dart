import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_datepicker.dart';
import 'package:erp_mobile/app/widgets/custom_dropdown.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomerDetailsDialog extends StatelessWidget {
  const CustomerDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return AlertDialog(
      title: const Text(
        'Customer Details',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SizedBox(
            width: 600,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownPicker(
                        items: const ['Code1', 'Code2', 'Code3'],
                        placeholder: 'Select Code',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Code is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomDropdownPicker(
                        items: const ['Country1', 'Country2', 'Country3'],
                        placeholder: 'Select Country',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Country is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Mobile 1',
                        labelText: 'Mobile 1 *',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile 1 is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Name',
                        labelText: 'Name *',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter First Name',
                        labelText: 'First Name',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Middle Name',
                        labelText: 'Middle Name',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Last Name',
                        labelText: 'Last Name',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Mobile 2',
                        labelText: 'Mobile 2',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Email Address',
                        labelText: 'Email Address *',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email Address is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownPicker(
                        items: const ['Male', 'Female', 'Other'],
                        placeholder: 'Select Gender',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Gender is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Marital Status',
                        labelText: 'Marital Status',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomDatePicker(
                        onDateSelected: (date) {},
                        labelText: 'Date of Birth *',
                        validator: (value) {
                          if (value == null) {
                            return 'Date of Birth is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownPicker(
                        items: const [
                          'Nationality1',
                          'Nationality2',
                          'Nationality3'
                        ],
                        placeholder: 'Select Nationality',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nationality is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter State',
                        labelText: 'State',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter City',
                        labelText: 'City',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Address',
                        labelText: 'Address *',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Address is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter Designation',
                        labelText: 'Designation *',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Designation is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownPicker(
                        items: const ['ID1', 'ID2', 'ID3'],
                        placeholder: 'Select ID Type',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ID Type is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextField(
                        controller: TextEditingController(),
                        placeholderText: 'Enter ID Number',
                        labelText: 'ID Number *',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ID Number is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomDatePicker(
                        onDateSelected: (date) {},
                        labelText: 'Expiry Date *',
                        validator: (value) {
                          if (value == null) {
                            return 'Expiry Date is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Handle save action
                        }
                      },
                      text: 'SAVE',
                    ),
                    const SizedBox(width: 8),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      text: 'CANCEL',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
