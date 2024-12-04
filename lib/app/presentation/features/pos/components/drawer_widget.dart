import 'package:erp_mobile/app/presentation/features/pos/components/karat_rate_table.dart';
import 'package:erp_mobile/app/presentation/features/pos/components/total_details_panel.dart';
import 'package:erp_mobile/app/presentation/features/pos/cubit/pos_cubit.dart';
import 'package:erp_mobile/app/presentation/features/pos/drawer_cubit/drawer_cubit_cubit.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final drawerCubit = BlocProvider.of<DrawerCubit>(context);
    final cubit = BlocProvider.of<PosCubit>(context);
    return Container(
      color: customColors().backgroundPrimary,
      height: size.height,
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, drawerState) {
          return BlocBuilder<PosCubit, PosState>(
            builder: (context, state) {
              if (state is PosLoaded) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: size.height * .12,
                            width: size.width / 3.5,
                            color: customColors().grey300,
                            child: Column(
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
                          if (drawerState.isKaratRateTableVisible)
                            KaratRateTable(karatRates: state.karatRate)
                          else
                            const TotalDetailsPanel(),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            drawerCubit.showKaratRateTable();
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: customColors().dodgerBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.bar_chart),
                          ),
                        ),
                        const SizedBox(height: 50),
                        InkWell(
                          onTap: () {
                            drawerCubit.showTotalDetailsPanel();
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: customColors().dodgerBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.work_outlined),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
