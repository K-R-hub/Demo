import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_1/layout/shop_app/cubit/cubit.dart';
import 'package:demo_1/models/shop_model/home_model.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:demo_1/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/cubit/states.dart';
import '../../../models/shop_model/categories_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if(state is ShopSuccessChangeFavoritesStat){
            if(state.model.status!){
              showToast(msg: state.model.message!, state: ToastState.SUCCESS);
            }else {
              showToast(msg: state.model.message!, state: ToastState.ERROR);
            }
          }
        },
        builder: (BuildContext, ShopStates) {
          return ShopCubit.get(context).homeModel != null &&
                  ShopCubit.get(context).categoriesModel != null
              ? ProductBuilder(ShopCubit.get(context).homeModel,
                  ShopCubit.get(context).categoriesModel, context)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget ProductBuilder(HomeModel? model, CategoriesModel? cModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: model?.data?.banners
                    ?.map((e) => Image(
                          image: NetworkImage(
                            '${e.image}',
                          ),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          BuildCategoriesProduct(cModel?.data?.data[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10,
                      ),
                      itemCount: cModel!.data!.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 1.58,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    model!.data!.products!.length,
                    (index) => BuildGridProduct(
                        model.data?.products?[index], context)),
              ),
            ),
          ],
        ),
      );

  Widget BuildCategoriesProduct(DataModel? model) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              model!.image!,
            ),
            width: 120.0,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          Container(
            width: 120,
            color: Colors.black.withOpacity(.8),
            child: Text(
              model.name!.toUpperCase(),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      );

  Widget BuildGridProduct(Products? model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(
                    model!.image!,
                  ),
                  width: double.infinity,
                  height: 200,
                ),
                if (model.discount! != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    color: Colors.red,
                    child: Text(
                      'Discount',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.2,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price!}',
                        style: TextStyle(
                          fontSize: 15,
                          color: defultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.oldPrice!}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id!);
                          print(model.id);
                        },
                        icon: CircleAvatar(
                            backgroundColor:
                                ShopCubit.get(context).favorites[model.id]!
                                    ? Colors.red
                                    : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
