
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';
import '../../../models/shop_model/favorites_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext, ShopStates) {},
        builder: (BuildContext, ShopStates) {
          return State is! ShopLoadingGetFavoritesState ?
          ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>buildProductItem(ShopCubit.get(context).favoritesModel?.data?.data?[index].product,context),
            separatorBuilder: (context, index) =>Container(
                  height: 1,
                  width: 1,
                  color: Colors.grey[300],
                ),
            itemCount:ShopCubit.get(context).favoritesModel!.data!.data!.length ,
          ): Center(child: CircularProgressIndicator());
        }
    );
  }


}
