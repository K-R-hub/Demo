import 'package:demo_1/layout/shop_app/cubit/states.dart';
import 'package:demo_1/models/shop_model/home_model.dart';
import 'package:demo_1/shared/components/constants.dart';
import 'package:demo_1/shared/network/end_points.dart';
import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/shop_model/categories_model.dart';
import '../../../models/shop_model/change_favorites_model.dart';
import '../../../models/shop_model/favorites_model.dart';
import '../../../models/shop_model/shop_login_model.dart';
import '../../../modules/news_app/search/search_screen.dart';
import '../../../modules/shop_app/cateogries/cateogries_screen.dart';
import '../../../modules/shop_app/favorites/favorites_screen.dart';
import '../../../modules/shop_app/products/products_screen.dart';
import '../../../modules/shop_app/settings/setting_screen.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> Screens = [
    ProductsScreen(),
    CateogriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorites = {94:false};
  void getHomeData() {
    emit(ShopLoadingHomeDataStat());
    DioHelper.getData(
      path: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value?.data);
      // print(homeModel?.status);
      // print(homeModel?.data?.banners?[0].image);
      homeModel?.data?.products?.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites);
      emit(ShopSuccessHomeDataStat());
    }).catchError((onError) {
      emit(ShopErrorHomeDataStat());
      print('the error is : ' + onError.toString());
    });
  }


  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    DioHelper.getData(
      path: CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value?.data);
      print(categoriesModel?.status);
      print(categoriesModel?.data?.data[0].name);
      emit(ShopSuccessCategoriesDataStat());
    }).catchError((onError) {
      print('the error is :' + onError.toString());
      emit(ShopErrorCategoriesDataStat());
    });
  }


  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopSuccessUsersChangeFavoritesStat());
    DioHelper.postData(
      path: FAVORITES,
      token: token,
      data: {
        'product_id': productId,
      },
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value?.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      }else{
        getFavorites();
      }
     // print(value?.data.toString());
      emit(ShopSuccessChangeFavoritesStat(changeFavoritesModel!));
    }).catchError((onError) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      path: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value?.data);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((onError) {
      print('the error is :' + onError.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }


  ShopLoginModel? profileModel;
  void getProfile() {
    emit(ShopLoadingGetProfileState());
    DioHelper.getData(
      path: PROFILE,
      token: token,
    ).then((value) {
       profileModel = ShopLoginModel.fromJson(value?.data);
       print(profileModel?.data?.name);
      emit(ShopSuccessGetProfileState());
    }).catchError((onError) {
      print('the error is :' + onError.toString());
      emit(ShopErrorGetProfileState());
    });
  }
  late ShopLoginModel updateModel;
  void updateUserData({
    required String name,
    required String email,
    required String phone,

  })
  {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      path: UPDATE_PROFAILE,
      token: token,
      data:
      {
        'name': name,
        'email': email,
        'phone': phone,

      },
    ).then((value)
    {
      //print(value?.data);
      getProfile();
      updateModel = ShopLoginModel.fromJson(value?.data);
      emit(ShopSuccessUpdateUserState(updateModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });

  }


}
