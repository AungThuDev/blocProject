import 'package:blocproject/bloc_page/bloc_event.dart';
import 'package:blocproject/bloc_page/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPage extends Bloc<BlocEvent, BlocState> {
  BlocPage() : super(InitialState());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginEvent) {
      yield LoginState();
    } else if (event is RegisterEvent) {
      yield RegisterState();
    } else if (event is HomeEvent) {
      yield HomeState();
    } else if (event is NewPostEvent) {
      yield NewPostState();
    } else if (event is PostListEvent) {
      yield PostListState();
    }
  }
}
