import 'package:chargemod_assign/app/profile/repo/profile.repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_detail_response.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;
  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<ProfileUpdateEvent>(_updateProfile);
    on<ProfileLoadEvent>(_getProfile);
  }

  _updateProfile(ProfileUpdateEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());
      final res = await repository.registerDetails(
          event.phone, event.first, event.last, event.email);
      print("update-profile ${res.userId}");
      add(ProfileLoadEvent());
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }

  _getProfile(ProfileLoadEvent event, Emitter<ProfileState> emit) async {
    try {
      final res = await repository.getProfileDetail();
      print("get-profile ${res.message}");
      if (res.statusCode == 1000) {
        emit(ProfileLoaded(user: res));
      } else {
        emit(const ProfileError(error: "Not Able to fetch Data"));
      }
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
