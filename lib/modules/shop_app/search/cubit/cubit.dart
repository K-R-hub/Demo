import 'package:demo_1/modules/shop_app/search/cubit/states.dart';
import 'package:demo_1/shared/components/constants.dart';
import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/shop_model/search_model.dart';
import '../../../../shared/network/end_points.dart';

class ShopSearchCubit extends Cubit<ShopSearchStates>{
  ShopSearchCubit() : super(ShopSearchInitialState());

  static ShopSearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  void search({
  required text,
}){
    emit(ShopSearchLoadingState());
    DioHelper.postData(
        path: SEARCH,
        token: token,
        data: {
          "text" : text
        },
    ).then((value) {
      searchModel = SearchModel.fromJson(value?.data);
      emit(ShopSearchSuccessState());
    }).catchError((onError){
      print(onError.toString());
      emit(ShopSearchErrorState());
    });
  }



}