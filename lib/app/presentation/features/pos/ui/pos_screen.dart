import 'package:erp_mobile/app/presentation/features/pos/components/karat_rate_table.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/sales_details_dialog.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/total_details_panel.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/voucher_details.dart';
import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/customer_details.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/line_items_tab_view.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/reciept_details_widget.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/sales_summary_panel.dart';
import 'package:erp_mobile/app/widgets/custom_button.dart';
import 'package:erp_mobile/app/widgets/dashboard_app_bar.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  PosScreenState createState() => PosScreenState();
}

class PosScreenState extends State<PosScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<PosCubit>(context);

    return BlocListener<PosCubit, PosState>(
      listener: (context, state) {
        if (state is PosLoaded) {
          showSalesDetailsDialog(context);
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const DrawerWidget(),
        appBar: DashboardAppBar(
          withDrawer: true,
          onDrawer: () {
            scaffoldKey.currentState?.openEndDrawer();
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return BlocBuilder<PosCubit, PosState>(builder: (context, state) {
              switch (state) {
                case PosInitial():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case PosLoaded():
                  return Container(
                    height: size.height,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                VoucherDetails(cubit: cubit),
                                const SizedBox(height: 10),
                                CustomerDetails(cubit: cubit),
                                const SizedBox(height: 10),
                                LineItemsTabView(tabController: _tabController),
                                const SizedBox(height: 10),
                                const RecieptDetailsWidget(),
                                const SizedBox(height: 10),
                                const SalesSummaryPanel(),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomElevatedButton(
                                      text: 'Save',
                                      onPressed: () {
                                        // Save action
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    CustomElevatedButton(
                                      text: 'Cancel',
                                      onPressed: () {
                                        // Cancel action
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // const SingleChildScrollView(
                        //   child: Column(
                        //     children: [
                        //       DrawerWidget(),
                        //     ],
                        //   ),
                        // )

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: customColors().dodgerBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.bar_chart),
                            ),
                            const SizedBox(height: 50),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: customColors().dodgerBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.work_outlined),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
              }
            });
          },
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<PosCubit>(context);
    return SafeArea(
      child: SizedBox(
        height: size.height,
        child: BlocBuilder<PosCubit, PosState>(
          builder: (context, state) {
            switch (state) {
              case PosInitial():
                return Center(
                  child: CircularProgressIndicator(
                    color: customColors().bluePrimary,
                  ),
                );
              case PosLoaded():
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: size.height * .12,
                        width: size.width / 4,
                        color: customColors().grey300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Net Total',
                              style: customTextStyle(
                                fontStyle: FontStyle.titleleLargeMedBold,
                                color: FontColor.dodgerBlue,
                              ),
                            ),
                            Text(
                              '${cubit.currency.text} 0.00',
                              style: customTextStyle(
                                fontStyle: FontStyle.titleleLargeMedBold,
                                color: FontColor.fontPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      KaratRateTable(karatRates: state.karatRate),
                      const TotalDetailsPanel()
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

void showSalesDetailsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const SalesDetailsDialog();
    },
  );
}
