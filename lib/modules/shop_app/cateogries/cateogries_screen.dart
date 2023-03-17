import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../layout/shop_app/cubit/states.dart';
import '../../../models/shop_model/categories_model.dart';

class CateogriesScreen extends StatelessWidget {
  const CateogriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext, ShopStates) {},
        builder: (BuildContext, ShopStates) {
          return ShopCubit.get(context).categoriesModel != null ?
              ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    BuildCatItem(
                    ShopCubit.get(context).categoriesModel
                    ?.data
                    ?.data[index]),
                separatorBuilder: (context, index) =>
                     Container(
                       height: 1,
                       width: 1,
                       color: Colors.grey[300],
                ),
            itemCount: ShopCubit
                .get(context)
                .categoriesModel!
                .data!
                .data
                .length,
          ): Center(child: CircularProgressIndicator());
        }
    );
  }

  Widget BuildCatItem(DataModel? model) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                model!.image!,
              ),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Text(
                model.name!.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      );
}
