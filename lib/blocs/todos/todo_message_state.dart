import 'package:equatable/equatable.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/todo_message/todo_message_model.dart';

class TodoMessageState extends Equatable {
  final TodoMessageModel message;
  final List<TodoMessageModel> messages;
  final String errorText;
  final FormStatus status;

  const TodoMessageState({
    required this.message,
    required this.messages,
    required this.errorText,
    required this.status,
  });

  TodoMessageState copyWith({
    TodoMessageModel? message,
    List<TodoMessageModel>? messages,
    String? errorText,
    FormStatus? status,
  }) =>
      TodoMessageState(
        message: message ?? this.message,
        messages: messages ?? this.messages,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [message, messages, errorText, status];
}
