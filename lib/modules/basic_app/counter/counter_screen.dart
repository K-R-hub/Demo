import 'package:demo_1/modules/basic_app/counter/cubit/cubit.dart';
import 'package:demo_1/modules/basic_app/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterSates>(
        listener: (BuildContext context, state) {
          if (state is CounterPlusState) {}
          if (state is CounterMinusState) {}
        },
        builder: (BuildContext context, Object? state) {
          CounterCubit cubit = CounterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter'),
            ),
            body: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        cubit.Plus();
                      },
                      child: Text(
                        'plus',
                        style: TextStyle(fontSize: 30),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${cubit.couner}',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.Minus();
                    },
                    child: Text(
                      'Minus',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
