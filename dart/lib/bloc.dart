import 'dart:async';

import 'package:dart/todo_model.dart';
import 'package:dart/todo_state.dart';

class MainBloc {
  final StreamController<String> _streamController = StreamController();
  Stream<TodoState> get stream =>
      _streamController.stream.asyncExpand<TodoState>(_fetchTodo);

  StreamSink<String> get sink => _streamController.sink;

  Stream<TodoState> _fetchTodo(String event) async* {
    yield LoadingState();
    Future.delayed(Duration(seconds: 1));
    yield ResponseState<Todo>(data: Todo(text: event));
  }
}
