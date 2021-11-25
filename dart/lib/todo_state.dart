import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {}

class LoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

class ErrorState extends TodoState {
  final String message;
  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class ResponseState<T extends Object> extends TodoState {
  final T data;
  ResponseState({required this.data});

  @override
  List<Object> get props => [data];
}
