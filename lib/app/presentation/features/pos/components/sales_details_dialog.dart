import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesDetailsDialog extends StatelessWidget {
  const SalesDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PosCubit>(context);
    return AlertDialog(
      title: const Text('Sales Details'),
      content: SingleChildScrollView(
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
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Division',
                              controller: cubit.divisionController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            labelText: 'Stock Code',
                            textInputAction: TextInputAction.done,
                            controller: cubit.stockCodeController,
                            onEditingComplete: () {
                              cubit.getStockDetails(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Stock Description',
                              controller: cubit.stockDescriptionController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Pcs',
                              controller: cubit.pcsController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing:
                                cubit.stockDescriptionController.text.isEmpty,
                            child: CustomTextField(
                              focusNode: cubit.grossWtFocusNode,
                              labelText: 'Gross Wt',
                              controller: cubit.grossWtController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Stone Wt',
                              controller: cubit.stoneWtController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Net Wt',
                              controller: cubit.netWtController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      visible: cubit.divisionController.text == 'G',
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Purity',
                                controller: cubit.purityController,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Pure Weight',
                                controller: cubit.purityWeightController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Metal Rate',
                              controller: cubit.metalRateController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Metal Amount',
                              controller: cubit.metalAmountController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Stone Rate',
                              controller: cubit.stoneRateController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Stone Amount',
                              controller: cubit.stoneAmountController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: (double.tryParse(
                                        cubit.grossWtController.text) ??
                                    0.00) <
                                1,
                            child: CustomTextField(
                              focusNode: cubit.makingRateFocusNode,
                              labelText: 'Making Rate',
                              controller: cubit.makingRateController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: (double.tryParse(
                                        cubit.grossWtController.text) ??
                                    0.00) >
                                1,
                            child: CustomTextField(
                              focusNode: cubit.makingAmountFocus,
                              labelText: 'Making Amount',
                              controller: cubit.makingAmountController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Visibility(
                      visible: cubit.divisionController.text != 'G',
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Rate',
                                controller: cubit.rateController,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Amount',
                                controller: cubit.amountController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    cubit.divisionController.text != 'G'
                        ? const SizedBox(height: 10)
                        : const SizedBox(),
                    Visibility(
                      visible: cubit.divisionController.text != 'G',
                      child: Row(
                        children: [
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Discount %',
                                controller: cubit.discountPercentController,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Discount Amount',
                                controller: cubit.discountAmountController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Total Amount',
                              controller: cubit.totalAmountController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Tax %',
                              controller: cubit.taxPercentController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Tax Amount',
                              controller: cubit.taxAmountController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: true,
                            child: CustomTextField(
                              labelText: 'Net Amount',
                              controller: cubit.netAmountController,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 80,
                            child: AbsorbPointer(
                              absorbing: true,
                              child: CustomTextField(
                                labelText: 'Tag Details',
                                maxLines: 3,
                                controller: cubit.tagDetailsController,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomElevatedButton(
                          onPressed: () {},
                          text: 'Cancel',
                        ),
                        CustomElevatedButton(
                          onPressed: () {},
                          text: 'Save',
                        ),
                        CustomElevatedButton(
                          onPressed: () {},
                          text: 'Continue',
                        ),
                      ],
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
