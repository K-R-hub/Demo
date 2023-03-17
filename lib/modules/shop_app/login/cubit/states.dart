import 'package:demo_1/models/shop_model/shop_login_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitilState extends ShopLoginStates{}

class ShopLoginLodingState extends ShopLoginStates{}

class ShopLoginSuccsessState extends ShopLoginStates{
  late final ShopLoginModel shopModel;
  ShopLoginSuccsessState(this.shopModel);
}

class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}

class ShopLoginChangeVisibilityState extends ShopLoginStates{}
