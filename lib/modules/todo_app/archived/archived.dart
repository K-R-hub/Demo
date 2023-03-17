import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';


class Archive extends StatelessWidget {
  const Archive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var tasks = AppCubit.get(context).archiveTasks;
          return ListView.separated(
            itemBuilder: (context, index) => itemViweDatabase(tasks[index] , context),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.lightBlue,
              ),
            ),
            itemCount: tasks.length,
          );
        });
  }
}