import 'package:bloc/bloc.dart';

part 'drawer_cubit_state.dart';


class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerState.initial());

  void showKaratRateTable() {
    emit(state.copyWith(isKaratRateTableVisible: true));
  }

  void showTotalDetailsPanel() {
    emit(state.copyWith(isKaratRateTableVisible: false));
  }

  void toggleViewOnScroll(bool atEndOfKaratRateTable) {
    if (atEndOfKaratRateTable) {
      showTotalDetailsPanel();
    } else {
      showKaratRateTable();
    }
  }
}