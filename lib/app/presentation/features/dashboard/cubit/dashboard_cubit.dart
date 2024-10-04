import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/product_moules.dart';
import 'package:erp_mobile/constants/assets/icon_assets.dart';
import 'package:erp_mobile/services/service_locator.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final ServiceLocator _serviceLocator;
  late List<ProductModuleResponse> _productModulesModel;
  DashboardCubit(this._serviceLocator) : super(DashboardInitial()) {
    _init();
  }
  late final List<Map<String, dynamic>> modules;

  void _init() {
    getInitialData();
    modules = [
      {
        'label': 'Addons',
        'icon': AssetIcons.addOns,
      },
      {
        'label': 'Boiling',
        'icon': AssetIcons.boiling,
      },
      {
        'label': 'Bullion',
        'icon': AssetIcons.bullion,
      },
      {
        'label': 'Catalogue',
        'icon': AssetIcons.catalogue,
      },
      {
        'label': 'Component Wise Diamond',
        'icon': AssetIcons.componentwise,
      },
      {
        'label': 'Fixed Asset',
        'icon': AssetIcons.fixedAssets,
      },
      {
        'label': 'General',
        'icon': AssetIcons.general,
      },
      {
        'label': 'Jewellery Manufacturing',
        'icon': AssetIcons.jewelleryManufacturing,
      },
      {
        'label': 'Payroll and HR',
        'icon': AssetIcons.payroll,
      },
      {
        'label': 'Refinery',
        'icon': AssetIcons.refinery,
      },
      {
        'label': 'Repairing',
        'icon': AssetIcons.repairing,
      },
      {
        'label': 'Retail',
        'icon': AssetIcons.retail,
      },
      {
        'label': 'Wholesale',
        'icon': AssetIcons.wholesale,
      },
    ];
  }

  void getInitialData() async {
    final res =
        await _serviceLocator.apiService.sendProductModuleModelRequest();
    _productModulesModel = res.response;
    emit(DashboardLoaded(productModuleResponse: _productModulesModel));
  }
}
