import 'package:bloc/bloc.dart';
import 'package:chargemod_assign/app/home/model/location_response.dart';
import 'package:chargemod_assign/app/home/repo/location_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LocationRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LoadLocationEvent>(_loadLocation);
  }

  _loadLocation(LoadLocationEvent event, Emitter<HomeState> emit) async {
    try {
      final res = await repository.getLocationDetail();
      print("get-location ${res.feasibilityStatus}");
      if (res.statusCode == 1000) {
        emit(LocationLoaded(location: res));
      } else {
        emit(const HomeError(error: "Not Able to fetch Data"));
      }
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }
}
