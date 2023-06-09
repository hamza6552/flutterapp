import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/auth_manager.dart';
import '../../../core/utils/form_validation.dart';

part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(Initial());

  Future<void> signup(String email, String password, String fullName) async {
    try {
      FormValidation formValidation = FormValidation();
      if (formValidation.validateFullName(fullName) != null)
        emit(Error(error: formValidation.validateFullName(fullName)!));
      else if (formValidation.validateEmail(email) != null)
        emit(Error(error: formValidation.validateEmail(email)!));
      else if (formValidation.validatePassword(password) != null)
        emit(Error(error: formValidation.validatePassword(password)!));
      else {
        emit(Loading());
        final response =
            await AuthManager.instance.signup(email, password, fullName);
        emit(Loaded());
      }
    } catch (e) {
      print(e);
      emit(Error(error: e.toString()));
    }
  }
}

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = Initial;

  const factory SignupState.loading() = Loading;

  const factory SignupState.loaded() = Loaded;

  const factory SignupState.error({required String error}) = Error;
}
