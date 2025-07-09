import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ThemeEvent {}

final class TogglePressed extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  bool isLight = false;
  ThemeBloc() : super(false) {
    on<TogglePressed>(_toggle);
  }
  void _toggle(TogglePressed event, Emitter<bool> emit) => emit(!state);
}
