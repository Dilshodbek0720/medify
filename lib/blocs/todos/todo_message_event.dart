import 'package:equatable/equatable.dart';
import 'package:medify/data/models/todo_message/todo_message_model.dart';

abstract class TodoMessageEvent extends Equatable {}

class SendTodoMessage extends TodoMessageEvent {
  final TodoMessageModel todoMessageModel;

  SendTodoMessage({required this.todoMessageModel});
  @override
  List<Object?> get props => [todoMessageModel];
}

class GetTodoMessage extends TodoMessageEvent {
  @override
  List<Object?> get props => [];
}
