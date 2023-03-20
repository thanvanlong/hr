import 'package:bloc/bloc.dart';
import 'package:untitled/ui/countHome/bloc/count_event.dart';
import 'package:untitled/ui/countHome/bloc/count_state.dart';

class CounterBloc extends Bloc<CountEvent,CountState> {

  int count = 0;

  @override
  CountState get initialState => Success(count);

  @override
  Stream<CountState> mapEventToState(CountEvent event) async* {
    if (event is Increment) {
      yield Loading();
      await Future.delayed(Duration(seconds: 1));
      count++;
      yield Success(count);
    }
  }
}