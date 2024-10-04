import 'package:erp_mobile/app/presentation/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:erp_mobile/app/widgets/dashboard_app_bar.dart';
import 'package:erp_mobile/app_page_injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<DashboardCubit>(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoaded) {
              // final List<ProductModuleResponse> res =
              //     state.productModuleResponse;

              // Filter visible modules based on the response
              // final visibleModules = modules.where((module) {
              //   return res
              //       .any((element) => element.moduleName == module['label']);
              // }).toList();

              return Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 4 : 6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: cubit.modules.map((module) {
                        return IconGridItem(
                          label: module['label'],
                          icon: module['icon'],
                          onTap: () {
                            if (module['label'] == "Retail") {
                              context.navigationService
                                  .openRetailsPageRoute(context);
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const Footer(),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class IconGridItem extends StatelessWidget {
  final String label;
  final String icon;
  final void Function()? onTap;

  const IconGridItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: const Text(
        '2024 © Contact us for more queries: www.suntech-global.com/customer-support',
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
