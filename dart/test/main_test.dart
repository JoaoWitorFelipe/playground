import 'package:dart/bloc.dart';
import 'package:dart/todo_model.dart';
import 'package:dart/todo_state.dart';
import 'package:test/test.dart';

void main() {
  final MainBloc mainBloc = MainBloc();

  test('should fetch todo', () {
    final text = 'hello';
    final data = Todo(text: text);

    expectLater(
      mainBloc.stream,
      emitsInOrder(
        [LoadingState(), ResponseState<Todo>(data: data)],
      ),
    );

    mainBloc.sink.add(text);
  });
}
