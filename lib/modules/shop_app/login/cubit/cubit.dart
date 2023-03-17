import 'package:demo_1/models/shop_model/shop_login_model.dart';
import 'package:demo_1/modules/shop_app/login/cubit/states.dart';
import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitilState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  bool isPassword= true;
  IconData suffixIcon = Icons.remove_red_eye_outlined;

  void changIsPassword(){
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangeVisibilityState());

  }
  late ShopLoginModel shopModel;
  void userLogin({
  required String email,
  required String password,
}) {
    emit(ShopLoginLodingState());
    DioHelper.postData(
      path: LOGIN,
      data: {
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value?.data);
      shopModel = ShopLoginModel.fromJson(value?.data);
      emit(ShopLoginSuccsessState(shopModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

}