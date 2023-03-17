import 'package:demo_1/layout/news_layout/cubit/states.dart';

import 'package:demo_1/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/news_app/buisness/buisness.dart';
import '../../../modules/news_app/science/science.dart';
import '../../../modules/news_app/sports/sports.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() :super(NewsInistialState());

  static NewsCubit get(context) => BlocProvider.of(context);


  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
        icon:const Icon(Icons.business_center),

      label: 'Business',
    ),
    BottomNavigationBarItem(
        icon:const Icon(Icons.sports),
      label: 'Sports',

    ),
    BottomNavigationBarItem(
        icon:const Icon(Icons.science_outlined),
      label: 'Science',

    ),
  ];

  void changIndex(Index){
    currentIndex = Index;
    if(Index == 1)
      getSports();
    if(Index == 2)
      getScience();

    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness(){
    emit(NewslodingState());
    DioHelper.getData(
        path:'v2/top-headlines',
        query: {
          "country": "eg",
          "category": "business",
          "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
        }

    ).then((value) {
      business = value?.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSucssessState());


    }).catchError((onError){
      print(onError.toString());
      emit(NewsGetBusinessErorrState(onError.toString()));
    });
}




  List<dynamic> sports = [];
  void getSports(){

    if(sports.length == 0){
      emit(NewslodingState());
      DioHelper.getData(
          path: 'v2/top-headlines',
          query: {
            "country": "eg",
            "category": "sports",
            "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
          }

      ).then((value) {
        sports = value?.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSucssessState());


      }).catchError((onError){
        print(onError.toString());
        emit(NewsGetSportsErorrState(onError.toString()));
      });
    }else emit(NewsGetSportsSucssessState());

  }

  List<dynamic> science = [];
  void getScience(){

    if(science.length == 0){
      emit(NewslodingState());
      DioHelper.getData(
          path: 'v2/top-headlines',
          query: {
            "country": "eg",
            "category": "science",
            "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
          }

      ).then((value) {
        science = value?.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSucssessState());


      }).catchError((onError){
        print(onError.toString());
        emit(NewsGetScienceErorrState(onError.toString()));
      });
    }else emit(NewsGetScienceSucssessState());

  }

  List<dynamic> search = [];
  void getSearch(String value) {
    //emit(NewslodingState());

    DioHelper.getData(
            path:'v2/everything',
            query: {
              "q": "$value",
              "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
            }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value?.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSucssessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErorrState(error.toString()));
    });
  }

  // List<dynamic> search = [];
  // void getSearch(String value){
  //
  //   DioHelper.getData(
  //       path:'v2/everything',
  //       qurey: {
  //         "q": "$value",
  //         "apiKey": "65f7f556ec76449fa7dc7c0069f040ca",
  //       }
  //   ).then((value) {
  //     search = value?.data['articles'];
  //     print(search[0]['title']);
  //
  //     emit(NewsGetSearchSucssessState());
  //
  //
  //   }).catchError((String E){
  //     emit(NewsGetSearchErorrState(onError.toString()));
  //   });
  //
  //
  // }



}