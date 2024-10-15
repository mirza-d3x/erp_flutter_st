import 'package:erp_mobile/app/presentation/features/retails/cubit/retails_cubit.dart';
import 'package:erp_mobile/app/widgets/dashboard_app_bar.dart';
import 'package:erp_mobile/app_page_injectable.dart';
import 'package:erp_mobile/constants/assets/icon_assets.dart';
import 'package:erp_mobile/constants/theme/styles.dart';
import 'package:erp_mobile/utils/console_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RetailsScreen extends StatelessWidget {
  const RetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: BlocBuilder<RetailsCubit, RetailState>(
        builder: (context, state) {
          if (state is RetailsLoaded) {
            // Fetch the menu submodules
            final retailMenuSubModules = state.retailMenuSubModules;

            return Container(
              height: size.height,
              width: size.width,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dynamically build each sub-menu based on API response
                    Row(
                      children:
                          retailMenuSubModules.keys.map<Widget>((submenuKey) {
                        final menuOptions =
                            retailMenuSubModules[submenuKey] ?? [];
                        return CustomPopupMenu(
                          title:
                              submenuKey, // Dynamic title from API response key
                          menuOptions: menuOptions, // Dynamic options
                          onSelected: (value) {
                            consoleLog('Selected: $value');
                            if (value == 'Sale') {
                              context.navigationService
                                  .openMenuDetailsPageRoute(context);
                            }
                          },
                        );
                      }).toList(),
                    ),
                    const SectionTitleWidget(
                      title: 'Sales Performance',
                    ),
                    const DashboardRowWidget(items: [
                      DashboardItem(
                        title: 'Total Sales Revenue',
                        value: '25.5K',
                        icon: AssetIcons.salesRevenue,
                      ),
                      DashboardItem(
                        title: 'ATV',
                        value: '1.4K',
                        icon: AssetIcons.atv,
                      ),
                      DashboardItem(
                        title: 'Sales By Product Category',
                        value: '24.5K',
                        icon: AssetIcons.salesProduct,
                      ),
                    ]),
                    const SectionTitleWidget(title: 'Customer Metrics'),
                    const DashboardRowWidget(items: [
                      DashboardItem(
                        title: 'Customer Footfall',
                        value: '66.5K',
                        icon: AssetIcons.customerFootfall,
                      ),
                      DashboardItem(
                        title: 'CLTV',
                        value: '4.5K',
                        icon: AssetIcons.cltv,
                      ),
                      DashboardItem(
                        title: 'Repeat Purchase Rate',
                        value: '3.5K',
                        icon: AssetIcons.repeatPurchaseRate,
                      ),
                    ]),
                    const SectionTitleWidget(
                      title: 'Inventory Management',
                    ),
                    const DashboardRowWidget(items: [
                      DashboardItem(
                        title: 'Inventory Turnover',
                        value: '12.5K',
                        icon: AssetIcons.inventoryTurnover,
                      ),
                      DashboardItem(
                        title: 'DSI',
                        value: '22.5K',
                        icon: AssetIcons.dsi,
                      ),
                      DashboardItem(
                        title: 'Stock Levels by Product Category',
                        value: '9.5K',
                        icon: AssetIcons.productCategory,
                      ),
                      DashboardItem(
                        title: 'Out-of-Stock Rate',
                        value: '8.5K',
                        icon: AssetIcons.percentageProducts,
                      ),
                    ]),
                    const SectionTitleWidget(
                      title: 'Profitability',
                    ),
                    const DashboardRowWidget(items: [
                      DashboardItem(
                        title: 'Gross Profit Margin',
                        value: '66.5K',
                        icon: AssetIcons.grossProfit,
                      ),
                      DashboardItem(
                        title: 'Net Profit Margin',
                        value: '6.5K',
                        icon: AssetIcons.netProfit,
                      ),
                      DashboardItem(
                        title: 'Cost of Goods Sold (COGS)',
                        value: '4.5K',
                        icon: AssetIcons.cogs,
                      ),
                      DashboardItem(
                        title: 'Discounts and Markdowns',
                        value: '2.5K',
                        icon: AssetIcons.discounts,
                      ),
                    ]),
                    const SectionTitleWidget(
                      title: 'Employee Performance',
                    ),
                    const DashboardRowWidget(items: [
                      DashboardItem(
                        title: 'Sales per Employee',
                        value: '78.5K',
                        icon: AssetIcons.salesEmployee,
                      ),
                    ]),
                    const SectionTitleWidget(
                      title: 'Customer Satisfaction',
                    ),
                    const DashboardRowWidget(
                      items: [
                        DashboardItem(
                          title: 'Return Rate',
                          value: '32.5K',
                          icon: AssetIcons.returnRate,
                        ),
                      ],
                    ),
                    const SectionTitleWidget(
                      title: 'Supplier Performance',
                    ),
                    const DashboardRowWidget(
                      items: [
                        DashboardItem(
                          title: 'Lead Time',
                          value: '44.5K',
                          icon: AssetIcons.leadTime,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is RetaislError) {
            return Center(child: Text('Error loading data: ${state.error}'));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class CustomPopupMenu extends StatelessWidget {
  final String title;
  final List<String> menuOptions;
  final Function(String) onSelected;

  const CustomPopupMenu({
    super.key,
    required this.title,
    required this.menuOptions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (context) => menuOptions
          .map(
            (option) => PopupMenuItem(
              value: option,
              child: Text(
                option,
                style: TextStyle(
                  color: customColors().bluePrimary,
                ),
              ),
            ),
          )
          .toList(),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: customColors().bluePrimary,
            ),
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  PopupMenuItem<String> popupMenuItem(String title) {
    return PopupMenuItem(
      value: title,
      child: Text(
        title,
        style: TextStyle(
          color: customColors().bluePrimary,
        ),
      ),
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  final String title;
  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: customTextStyle(
        fontStyle: FontStyle.headerSBold,
        color: FontColor.grey600,
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String value;
  final String icon;
  const DashboardItem({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class DashboardRowWidget extends StatelessWidget {
  final List<DashboardItem> items;
  const DashboardRowWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: items
            .map(
              (item) => DashboardCardWidget(item: item),
            )
            .toList(),
      ),
    );
  }
}

class DashboardCardWidget extends StatelessWidget {
  final DashboardItem item;
  const DashboardCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 220,
        height: 160,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.icon,
              width: 40,
              height: 40,
            ),
            const SizedBox(height: 8),
            Text(
              item.value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: customTextStyle(
                fontStyle: FontStyle.titleMedium,
                color: FontColor.grey900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
