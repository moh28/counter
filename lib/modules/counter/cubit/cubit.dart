import 'package:bloc/bloc.dart';
import 'package:first/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterCubit extends Cubit<CounterStates>{
  CounterCubit (): super(InitialState());
  static CounterCubit get(context)=>BlocProvider.of(context);
  int count=0;
  void minus(){
    count--;
    emit(MinusState(count));
  }
  void plus(){
    count++;
    emit(PlusState(count));
  }

}