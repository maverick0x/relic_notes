import 'package:bloc/bloc.dart';

enum OnBoardEvent { increment, decrement }

class OnBoardBloc extends Bloc<OnBoardEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(OnBoardEvent event) async* {
    switch (event) {
      case OnBoardEvent.increment:
        yield state + 1;
        break;
      case OnBoardEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
