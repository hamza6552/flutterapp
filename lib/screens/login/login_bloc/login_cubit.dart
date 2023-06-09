import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zabardash/core/networking/auth_manager.dart';
import 'package:zabardash/core/utils/form_validation.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(Initial());

  Future<void> login(String email, String password) async {
    try {
      FormValidation formValidation = FormValidation();
      if (formValidation.validateEmail(email) != null)
        emit(Error(error: formValidation.validateEmail(email)!));
      else if (formValidation.validatePassword(password) != null)
        emit(Error(error: formValidation.validatePassword(password)!));
      else {
        emit(Loading());
        final response = await AuthManager.instance.login(email, password);
        emit(Loaded());
      }
    } catch (e) {
      print(e);
      emit(Error(error: e.toString()));
    }
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = Initial;

  const factory LoginState.loading() = Loading;

  const factory LoginState.loaded() = Loaded;

  const factory LoginState.error({required String error}) = Error;
}
