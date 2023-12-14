import 'package:chargemod_assign/app/auth/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(UnAuthenticated()) {
    on<SendOTPEvent>(_sendOtp);
    on<ReSendOTPEvent>(_resendOtp);
    on<VerifyOTPEvent>(_verifyOtp);
    on<LogOutEvent>(_logOut);
  }

  _sendOtp(SendOTPEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final res = await repository.sendOtp(event.phone);
      if (res.statusCode == 1000) {
        emit(OTPSentState());
      } else {
        emit(AuthError(error: res.message.toString()));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  _resendOtp(ReSendOTPEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final res = await repository.resendOtp(event.phone);
      if (res.statusCode == 1000) {
        emit(OTPReSentState());
      } else {
        emit(AuthError(error: res.message.toString()));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  _verifyOtp(VerifyOTPEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final res = await repository.verifyOtp(event.phone, event.otp);
      if (res.statusCode == 1000) {
        GetStorage().write('aToken', res.data!.accessToken);
        GetStorage().write('rToken', res.data!.refreshToken);
        GetStorage().write('firstTime', res.data!.isNewUser);
        emit(Authenticated());
      } else {
        emit(AuthError(error: res.message.toString()));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  _logOut(LogOutEvent event, Emitter<AuthState> emit) {
    emit(UnAuthenticated());
  }
}
