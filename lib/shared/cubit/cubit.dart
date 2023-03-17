import 'package:demo_1/shared/cubit/states.dart';
import 'package:demo_1/shared/network/local/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:async';

import '../../modules/todo_app/archived/archived.dart';
import '../../modules/todo_app/done/done.dart';
import '../../modules/todo_app/tasks/tasks.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  late Database db;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  List<Widget> screens = [
    Tasks(),
    Done(),
    Archive(),
  ];
  List<String> titles = [
    'Tasks',
    'Done',
    'Archived',
  ];

  void ChangIndex(index) {
    currentIndex = index;
    emit(ChangStateNavBar());
  }

  void CreatDatabase() {
    openDatabase(
      'todo_app.db',
      version: 1,
      onCreate: (db, version) {
        print('Database Created');
        db
            .execute(
                'CREATE TABLE Tasks(id INTEGER PRIMARY KEY,title TEXT, date TEXT , time TEXT, status TEXT)')
            .then((value) {
          print('Tables Created');
        }).catchError((e) {
          print('table error ${e.toString()}');
        });
      },
      onOpen: (db) {
        getDatabase(db);
        print('Open database');
      },
    ).then((value) {
      db = value;
      emit(AppCreatdbState());
    });
  }

  Future insertDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    return await db.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO Tasks(title,date,time,status) VALUES("$title","$date","$time","NEW") ')
          .then((value) {
        print('$value insert successfully');
        emit(AppInsertdbState());
        getDatabase(db);
      }).catchError((e) {
        print('inerting new record error ${e.toString()} ');
      });

      return Future(() => null);
    });
  }

  void getDatabase(db) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    db.rawQuery('SELECT * FROM Tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'NEW') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetdbState());
    });
  }

  bool openCloseBottomSheet = false;
  Icon iconk = Icon(Icons.edit);

  void ChangeIconBottomSheet({
    required bool isShow,
    required Icon icon,
  }) {
    openCloseBottomSheet = isShow;
    iconk = icon;
    emit(ChangeIconBottomSheetState());
  }

  void updatedb({
    required String status,
    required int id,
  }) {
    db.rawUpdate(
      'UPDATE Tasks SET status = ? WHERE id = ? ',
      [status, id],
    ).then((value) {
      getDatabase(db);
      emit(AppUpdateState());
    });
  }

  void deletFromDb({
    required int id,
  }) {
    db.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
      getDatabase(db);
      emit(AppDeletState());
    });
  }

  bool isDark = false;

  void changeMode({bool? stateMode}) {
     if(stateMode != null){
       isDark = stateMode;
       emit(AppModeState());
     }else{
       isDark = !isDark;
       CacheHelper.saveData(key: 'isDark', value: isDark);
       emit(AppModeState());
     }
  }

}
