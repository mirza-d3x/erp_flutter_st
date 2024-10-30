import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/presentation/features/pos/ui/pos_screen.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_datepicker.dart';
import 'package:erp_mobile/app/widgets/custom_searchable_dropdown_picker.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherDetails extends StatelessWidget {
  final PosCubit cubit;

  const VoucherDetails({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<PosCubit, PosState>(
        builder: (context, state) {
          switch (state) {
            case PosInitial():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PosLoaded():
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Voucher Details',
                    style: customTextStyle(
                      fontStyle: FontStyle.titleSmallSemiBold,
                      color: FontColor.fontPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: CustomElevatedButton(
                            text: 'New',
                            onPressed: () {
                              showSalesDetailsDialog(context);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: CustomTextField(
                            controller: cubit.voucherName,
                            labelText: 'Voucher',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: CustomTextField(
                            controller: cubit.voucherNo,
                            labelText: 'Voc.No',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: CustomTextField(
                            controller: cubit.currency,
                            labelText: 'Currency',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: AbsorbPointer(
                          absorbing: true,
                          child: CustomTextField(
                            controller: cubit.currencyRate,
                            labelText: 'Cur.Rate',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        flex: 2,
                        child: CustomDatePicker(labelText: 'Date'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: CustomSearchableDropdownPicker(
                          items: state.salesPersonsList,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
