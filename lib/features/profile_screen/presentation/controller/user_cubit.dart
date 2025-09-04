import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/profile_screen/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUser() {
    emit(UserIsGuest());
  }
}
