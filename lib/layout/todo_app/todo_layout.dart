

import 'package:demo_1/shared/cubit/cubit.dart';
import 'package:demo_1/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/components/components.dart';

class HomeLayout extends StatelessWidget {



  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var titleControler = TextEditingController();
  var dateControler = TextEditingController();
  var timeControler = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..CreatDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) { },
        builder: (BuildContext context, Object? state) {

          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
              key: scaffoldkey,
              appBar: AppBar(
                title: Text(cubit.titles[cubit.currentIndex]),
              ),
              body:cubit.screens[cubit.currentIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (cubit.openCloseBottomSheet) {
                    if (formkey.currentState!.validate()) {
                      cubit.insertDatabase(
                        title: titleControler.text,
                        date: dateControler.text,
                        time: timeControler.text,
                      ).then((valu) {
                        Navigator.pop(context);

                      });
                    }
                  } else {
                    scaffoldkey.currentState?.showBottomSheet(
                          (context) => Container(
                        color: Colors.grey[100],
                        padding: EdgeInsets.all(5),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defultFormField(
                                label: 'Task Title',
                                keyboardType: TextInputType.text,
                                prefix: Icon(Icons.title),
                                textControl: titleControler,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              defultFormField(
                                label: 'Task Date',
                                keyboardType: TextInputType.datetime,
                                prefix: Icon(Icons.date_range_outlined),
                                textControl: dateControler,
                                onTap: () {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-10-01'))
                                      .then((value) {
                                    dateControler.text = DateFormat.yMMMd().format(value!).toString();
                                    print(DateFormat.yMMMd().format(value));
                                  });
                                },
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              defultFormField(
                                label: 'Task Time',
                                keyboardType: TextInputType.number,
                                prefix: Icon(Icons.watch_later_outlined),
                                textControl: timeControler,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeControler.text = value!.format(context).toString();
                                    print(value.format(context));
                                  });
                                },
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Must not be empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).closed.then((value) {
                      cubit.ChangeIconBottomSheet(
                          isShow: false,
                          icon: Icon(Icons.edit)
                      );
                    });
                   cubit.ChangeIconBottomSheet(
                       isShow: true,
                       icon: Icon(Icons.dangerous_outlined),
                   );
                  };
                },
                child: cubit.iconk,
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedFontSize: 22,

                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.ChangIndex(index);
                  // setState(() {});
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check_circle_outline), label: 'Done'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.archive_outlined), label: 'Archive'),
                ],
              ));
        },

      ),
    );
  }





}
