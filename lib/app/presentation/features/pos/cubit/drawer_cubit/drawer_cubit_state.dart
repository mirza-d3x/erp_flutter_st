part of 'drawer_cubit_cubit.dart';

class DrawerState {
  final bool isKaratRateTableVisible;

  DrawerState({required this.isKaratRateTableVisible});

  factory DrawerState.initial() => DrawerState(isKaratRateTableVisible: true);

  DrawerState copyWith({bool? isKaratRateTableVisible}) {
    return DrawerState(
      isKaratRateTableVisible:
          isKaratRateTableVisible ?? this.isKaratRateTableVisible,
    );
  }
}
