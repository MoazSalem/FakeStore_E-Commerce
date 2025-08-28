import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());

  void init() {
    emit(MainScreenLoaded(index: 0));
  }

  void changeIndex(int index) {
    emit(MainScreenLoaded(index: index));
  }
}
