import 'package:demo_1/models/shop_model/change_favorites_model.dart';

import '../../../models/shop_model/shop_login_model.dart';

abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataStat extends ShopStates{}

class ShopSuccessHomeDataStat extends ShopStates{}

class ShopErrorHomeDataStat extends ShopStates{}

class ShopSuccessCategoriesDataStat extends ShopStates{}

class ShopErrorCategoriesDataStat extends ShopStates{}

class ShopSuccessUsersChangeFavoritesStat extends ShopStates{}

class ShopSuccessChangeFavoritesStat extends ShopStates{
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesStat(this.model);
}

class ShopErrorChangeFavoritesState extends ShopStates{}

class ShopLoadingGetFavoritesState extends ShopStates{}

class ShopSuccessGetFavoritesState extends ShopStates{}

class ShopErrorGetFavoritesState extends ShopStates{}

class ShopLoadingUpdateUserState extends ShopStates{}

class ShopSuccessUpdateUserState extends ShopStates{
  late final ShopLoginModel updateModel;
  ShopSuccessUpdateUserState(this.updateModel);

}

class ShopErrorUpdateUserState extends ShopStates{}

class ShopLoadingGetProfileState extends ShopStates{}

class ShopSuccessGetProfileState extends ShopStates{}

class ShopErrorGetProfileState extends ShopStates{}


