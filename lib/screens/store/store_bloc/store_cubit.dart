import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zabardash/core/networking/api_controller.dart';
import 'package:zabardash/models/read_products_model/read_products_model.dart';

part 'store_cubit.freezed.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(Initial());


 
  Future<void> readProducts() async {
    try {
      emit(Loading());
       final prefs = await SharedPreferences.getInstance();
      var store_id  =  prefs.getInt("Store_Id");
      final response = await ApiController.instance.readProducts(storeId:store_id!);
      emit(Loaded(readProductModel: response));
    } catch (e) {
      print(e);
      emit(Error(error: e.toString()));
    }
  }
}

@freezed
class StoreState with _$StoreState {
  const factory StoreState.initial() = Initial;

  const factory StoreState.loading() = Loading;

  const factory StoreState.loaded(
      {required List<ReadProductsModel> readProductModel}) = Loaded;

  const factory StoreState.error({required String error}) = Error;
}
