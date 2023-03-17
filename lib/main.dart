import 'package:bloc/bloc.dart';
import 'package:demo_1/layout/shop_app/shop_layout.dart';
import 'package:demo_1/modules/shop_app/login/login_screen.dart';
import 'package:demo_1/modules/social_app/social_login/login_screen.dart';
import 'package:demo_1/shared/bloc_observer.dart';
import 'package:demo_1/shared/components/constants.dart';
import 'package:demo_1/shared/cubit/cubit.dart';
import 'package:demo_1/shared/cubit/states.dart';
import 'package:demo_1/shared/network/local/cache_helper.dart';
import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:demo_1/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_layout/cubit/cubit.dart';
import 'layout/news_layout/news_layout.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'modules/shop_app/on_boarding/on_bording_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);

  if(onBoarding != null){
    if(token != null) widget = ShopLayout();
   else widget = ShopLoginScreen();
  }else widget = onBoardingScreen();

  runApp(MyApp(isDark,widget));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  Widget startWidget;
  MyApp(
      this.isDark,
      this.startWidget,
      );
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => NewsCubit()..getBusiness(),
          ),
          BlocProvider(
              create: (BuildContext context) => AppCubit()..changeMode(stateMode: isDark)
          ),
          BlocProvider(
              create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesData()..getFavorites()..getProfile(),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: AppCubit.get(context).isDark
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home: startWidget ,
              );
            }));
  }
}
