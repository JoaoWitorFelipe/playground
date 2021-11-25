import 'package:dart/bloc.dart';
import 'package:dart/json.dart';
import 'package:dart/todo_model.dart';
import 'package:dart/todo_state.dart';

void main() async {
  final mainBloc = MainBloc();

  mainBloc.sink.add(json['text']!);

  await for (TodoState event in mainBloc.stream) {
    if (event is LoadingState) {
      print('loading...');
    } else if (event is ErrorState) {
      print('error message: ${event.message}');
    } else {
      final response = event as ResponseState<Todo>;
      print('text after load: ${response.data.text}');
    }
  }
}
