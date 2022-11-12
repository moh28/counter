abstract class CounterStates{

}
class InitialState extends CounterStates{

}
class PlusState extends CounterStates{
  final int count;

  PlusState(this.count);

}
class MinusState extends CounterStates{
  final int count;

  MinusState(this.count);


}