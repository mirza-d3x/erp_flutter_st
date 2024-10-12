import 'package:erp_mobile/app/presentation/features/retails/ui/retails_screen.dart';
import 'package:erp_mobile/app/widgets/dashboard_app_bar.dart';
import 'package:erp_mobile/app_page_injectable.dart';
import 'package:erp_mobile/services/data_store/volatile/user_controller.dart';
import 'package:erp_mobile/utils/console_log.dart';
import 'package:flutter/material.dart';

class MenuDetailsScreen extends StatelessWidget {
  const MenuDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: UserController()
                  .retailMenuSubModules
                  .keys
                  .map<Widget>((submenuKey) {
                final menuOptions =
                    UserController().retailMenuSubModules[submenuKey] ?? [];
                return CustomPopupMenu(
                  title: submenuKey,
                  menuOptions: menuOptions,
                  onSelected: (value) {
                    consoleLog('Selected: $value');
                    // if (value == 'Sale') {
                    //   context.navigationService
                    //       .openMenuDetailsPageRoute(context);
                    // }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Sidebar with fixed InfoCard width
                  const Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoCard(title: 'Cycle Time', value: '32', width: 200),
                        SizedBox(height: 8),
                        InfoCard(title: 'Yield %', value: '22', width: 200),
                        SizedBox(height: 8),
                        InfoCard(
                            title: 'Through Out', value: '44M', width: 200),
                        SizedBox(height: 8),
                        Expanded(
                          child: InfoCard(
                            title: 'Defect Analysis',
                            width: 200,
                            child: BarChartPlaceholder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Middle Section (Data Table and Sale)
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        // Sale Section with Add Button
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Sale',
                                  style: TextStyle(fontSize: 18)),
                              IconButton(
                                onPressed: () {
                                  context.navigationService
                                      .openPosPageRoute(context);
                                  // Add your action for add button here
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Data Table Placeholder
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text('No Data',
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Right Sidebar with fixed InfoCard width
                  const Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoCard(
                            title: 'Quantity Produced',
                            value: '44M',
                            width: 200),
                        SizedBox(height: 8),
                        InfoCard(
                          title: 'Overall',
                          width: 200,
                          child: PieChartPlaceholder(),
                        ),
                        SizedBox(height: 8),
                        InfoCard(title: 'Quantity', value: '4M', width: 200),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// InfoCard Widget with width property
class InfoCard extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? child;
  final double width; // Added width property

  const InfoCard({
    super.key,
    required this.title,
    this.value,
    this.child,
    required this.width, // Require width in constructor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // Apply fixed width
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (value != null)
            Text(
              value!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

// Placeholder Widgets for Charts
class BarChartPlaceholder extends StatelessWidget {
  const BarChartPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue.withOpacity(0.2),
      child: const Center(child: Text('Bar Chart Placeholder')),
    );
  }
}

class PieChartPlaceholder extends StatelessWidget {
  const PieChartPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue.withOpacity(0.2),
      child: const Center(child: Text('Pie Chart Placeholder')),
    );
  }
}
