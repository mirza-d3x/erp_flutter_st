import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/presentation/features/pos/cubit/sales_details_cubit/sales_details_cubit.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/custom_text_field.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesDetailsDialog extends StatelessWidget {
  const SalesDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SalesDetailsCubit>(context);
    return AlertDialog(
      title: const Text('Sales Details'),
      content: SingleChildScrollView(
        child: BlocBuilder<SalesDetailsCubit, SalesDetailsState>(
          builder: (context, state) {
            switch (state) {
              case SalesDetailsInitial():
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              case SalesDetailsLoaded():
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: false,
                                  labelText: 'Division',
                                  controller: cubit.divisionController,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.streetAddress,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[a-zA-Z0-9]*$'),
                                    ),
                                  ],
                                  labelText: 'Stock Code',
                                  controller: cubit.stockCodeController,
                                  onEditingComplete: () {
                                    cubit.getStockDetails(context);
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: false,
                                  labelText: 'Stock Description',
                                  controller: cubit.stockDescriptionController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled:
                                      state.stockData.stockInfo?.divisionms ==
                                          'S',
                                  labelText: 'Pcs',
                                  controller: cubit.pcsController,
                                  focusNode: cubit.pcsFocusNode,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: (state.stockData.status ==
                                          'Success' &&
                                      state.stockData.stockInfo?.divisionms !=
                                          'S'),
                                  focusNode: cubit.grossWtFocusNode,
                                  labelText: 'Gross Wt',
                                  controller: cubit.grossWtController,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Visibility(
                                visible:
                                    state.stockData.stockInfo?.divisionms !=
                                        'S',
                                child: Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Stone Wt',
                                    controller: cubit.stoneWtController,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Visibility(
                                visible:
                                    state.stockData.stockInfo?.divisionms !=
                                        'S',
                                child: Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Net Wt',
                                    controller: cubit.netWtController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          state.stockData.stockInfo?.divisionms == 'S'
                              ? const SizedBox()
                              : const SizedBox(height: 5),
                          Visibility(
                            visible: state.stockData.stockInfo?.division == 'G',
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Purity',
                                    controller: cubit.purityController,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Pure Weight',
                                    controller: cubit.purityWeightController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            visible:
                                state.stockData.stockInfo?.divisionms != 'S',
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Metal Rate',
                                    controller: cubit.metalRateController,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Metal Amount',
                                    controller: cubit.metalAmountController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          state.stockData.stockInfo?.divisionms == 'S'
                              ? const SizedBox()
                              : const SizedBox(height: 5),
                          Visibility(
                            visible:
                                state.stockData.stockInfo?.divisionms != 'S',
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Stone Rate',
                                    controller: cubit.stoneRateController,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Stone Amount',
                                    controller: cubit.stoneAmountController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          state.stockData.stockInfo?.divisionms == 'S'
                              ? const SizedBox()
                              : const SizedBox(height: 5),
                          Visibility(
                            visible:
                                state.stockData.stockInfo?.divisionms != 'S',
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: cubit.stockDescriptionController
                                        .text.isNotEmpty,
                                    focusNode: cubit.makingRateFocusNode,
                                    labelText: 'Making Rate',
                                    controller: cubit.makingRateController,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: cubit.stockDescriptionController
                                        .text.isNotEmpty,
                                    focusNode: cubit.makingAmountFocus,
                                    labelText: 'Making Amount',
                                    controller: cubit.makingAmountController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            visible: cubit.divisionController.text != 'G',
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Rate',
                                    controller: cubit.rateController,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled: false,
                                    labelText: 'Amount',
                                    controller: cubit.amountController,
                                    focusNode: cubit.amountFocusNode,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            visible: cubit.divisionController.text != 'G',
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled:
                                        state.stockData.stockInfo?.divisionms ==
                                            'S',
                                    labelText: 'Discount %',
                                    controller: cubit.discountPercentController,
                                    focusNode: cubit.discountPercentFocusNode,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: CustomTextField(
                                    textInputType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+(\.\d*)?$'),
                                      ),
                                    ],
                                    enabled:
                                        state.stockData.stockInfo?.divisionms ==
                                            'S',
                                    labelText: 'Discount Amount',
                                    controller: cubit.discountAmountController,
                                    focusNode: cubit.discountAmountFocusNode,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: false,
                                  labelText: 'Total Amount',
                                  controller: cubit.totalAmountController,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: false,
                                  labelText: 'Tax %',
                                  controller: cubit.taxPercentController,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: false,
                                  labelText: 'Tax Amount',
                                  controller: cubit.taxAmountController,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d+(\.\d*)?$'),
                                    ),
                                  ],
                                  enabled: cubit.stockDescriptionController.text
                                      .isNotEmpty,
                                  focusNode: cubit.netAmountFocusNode,
                                  labelText: 'Net Amount',
                                  controller: cubit.netAmountController,
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 200,
                      width: 200,
                      color: customColors().grey300,
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 200,
                      width: 200,
                      color: customColors().grey300,
                    ),
                  ],
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
