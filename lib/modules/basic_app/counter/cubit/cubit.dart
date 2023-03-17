import 'package:bloc/bloc.dart';
import 'package:demo_1/modules/basic_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';







class CounterCubit extends Cubit<CounterSates> {
  CounterCubit() : super(InitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  var couner = 1;

  void Plus() {
    couner++;
    emit(CounterPlusState(couner));
  }

  void Minus() {
    couner--;
    emit(CounterMinusState(couner));
  }
}
