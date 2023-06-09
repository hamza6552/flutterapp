import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/models/home_data_model/home_data_model.dart';
import 'package:zabardash/models/read_stores_model/read_stores_model.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Initial());

  Future<void> homeData() async {
    try {
      emit(Loading());
      final homeResponse = await ApiController.instance.homeData(
        lat: 0.0123456789,
        lon: 0.0123456789,
      );
      final readStoreResponse = await ApiController.instance.readStores(
        lat: 0.123456789012345,
        lon: 0.123456789012345,
      );
      emit(Loaded(
        homeDataModel: homeResponse,
        readStoresModel: readStoreResponse,
      ));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;

  const factory HomeState.loading() = Loading;

  const factory HomeState.loaded({
    List<ReadStoresModel>? readStoresModel,
    HomeDataModel? homeDataModel,
  }) = Loaded;

  const factory HomeState.error({required String error}) = Error;
}
