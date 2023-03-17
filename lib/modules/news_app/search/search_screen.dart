import 'package:demo_1/layout/news_layout/cubit/cubit.dart';
import 'package:demo_1/layout/news_layout/cubit/states.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var textControl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {


          List<dynamic> list = NewsCubit.get(context).search;

          return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defultFormField(
                        textControl: textControl,
                        keyboardType: TextInputType.text,
                        label: 'Search',
                        prefix: Icon(Icons.search,color: Colors.deepOrange,),
                        onChange: (value) {
                           NewsCubit.get(context).getSearch(value);
                        },
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Its Null';
                          }
                          return null;
                        }),
                  ),

                  Expanded(child: articalBuilder(list, context,isSearch: true)),
                  //articalBuilder(list, context)
                ],
              ));
        });
  }
}
