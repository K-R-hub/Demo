abstract class CounterSates {}

class InitialState extends CounterSates {}

class CounterPlusState extends CounterSates {
  late final int counter;

  CounterPlusState(this.counter);
}

class CounterMinusState extends CounterSates {
  late final int counter;

  CounterMinusState(this.counter);
}
