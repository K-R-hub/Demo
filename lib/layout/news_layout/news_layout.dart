import 'package:demo_1/layout/news_layout/cubit/cubit.dart';
import 'package:demo_1/layout/news_layout/cubit/states.dart';
import 'package:demo_1/shared/components/components.dart';
import 'package:demo_1/shared/cubit/cubit.dart';
import 'package:demo_1/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      goToScreen(context,SearchScreen(),);
                    },
                    icon: Icon(Icons.search)
                ),
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 38,
              currentIndex: cubit.currentIndex,
              onTap: (Index){
                cubit.changIndex(Index);
              },
              items:cubit.bottomNav,
            ),


        );
      },

    );
  }
}
