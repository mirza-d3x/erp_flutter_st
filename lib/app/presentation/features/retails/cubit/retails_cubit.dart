import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erp_mobile/app/repository/modesl/response_models/menu_module_model.dart';
import 'package:erp_mobile/services/data_store/volatile/user_controller.dart';
import 'package:erp_mobile/services/service_locator.dart';

part 'retails_state.dart';

class RetailsCubit extends Cubit<RetailState> {
  final ServiceLocator _serviceLocator;

  RetailsCubit(this._serviceLocator) : super(RetailsInitial()) {
    _init();
  }

  late final List<ModuleResponse> menuModule;
  late final Map<String, List<String>> retailMenuSubModules;

  void _init() {
    _getInitialData();
  }

  Future<void> _getInitialData() async {
    try {
      // Fetching the menu module data
      menuModule = await _serviceLocator.apiService
          .sendMenuModuleRequest(userName: '', branch: '');

      // Filter and group logic
      retailMenuSubModules = _filterAndGroupModules(menuModule);
      UserController().retailMenuSubModules = retailMenuSubModules;
      // Emit a state with the new data if needed
      emit(RetailsLoaded(retailMenuSubModules));
    } catch (error) {
      emit(RetaislError(error.toString()));
    }
  }

  // Method to filter and group by MENU_SUB_MODULE and MENU_SUB_MODULE_GROUP
  Map<String, List<String>> _filterAndGroupModules(
      List<ModuleResponse> modules) {
    final retailModules =
        modules.where((module) => module.menuModule == "Retail").toList();

    Map<String, List<String>> subModuleGroupsMap = {};

    for (var module in retailModules) {
      if (subModuleGroupsMap.containsKey(module.menuSubModule)) {
        subModuleGroupsMap[module.menuSubModule]!.add(module.menuCaptionEng);
      } else {
        subModuleGroupsMap[module.menuSubModule] = [module.menuCaptionEng];
      }
    }

    return subModuleGroupsMap;
  }
}
