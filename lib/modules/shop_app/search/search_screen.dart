import 'package:demo_1/modules/shop_app/search/cubit/cubit.dart';
import 'package:demo_1/modules/shop_app/search/cubit/states.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shop_app/cubit/cubit.dart';
import '../../../shared/styles/colors.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);

  TextEditingController text = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit,ShopSearchStates>(
        listener: (context ,state){},
        builder: (context , state){
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defultFormField(
                      textControl: text,
                      keyboardType: TextInputType.text,
                      label: 'Search',
                      prefix: Icon(Icons.search),
                      validator: (s){
                        if(s == null || s.isEmpty)
                          return 'Enter Search';
                      },
                      onSubmit: (text){
                        ShopSearchCubit.get(context).search(text: text);
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is ShopSearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    if(state is ShopSearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>buildProductItem(ShopSearchCubit.get(context).searchModel?.data?.data?[index],context,isSearch: true),
                        separatorBuilder: (context, index) =>Container(
                              height: 1,
                              width: 1,
                              color: Colors.grey[300],
                            ),
                        itemCount:ShopSearchCubit.get(context).searchModel!.data!.data!.length ,
                      ),
                    ),
                  ],
                ),
              )
          );
        },
      ),
    );
  }
}
