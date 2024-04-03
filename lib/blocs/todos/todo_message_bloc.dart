import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/blocs/todos/todo_message_event.dart';
import 'package:medify/blocs/todos/todo_message_state.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/todo_message/todo_message_model.dart';

class TodoMessageBloc extends Bloc<TodoMessageEvent, TodoMessageState> {
  TodoMessageBloc()
      : super(
    TodoMessageState(
        message: TodoMessageModel(
          title: "",
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          endDateTime: "",
          startDateTime: ""
        ),
        messages: const [],
        errorText: '',
        status: FormStatus.pure),
  ) {
    on<GetTodoMessage>(getTodoMessage);
    on<SendTodoMessage>(sendTodoMessage);
  }

  List<TodoMessageModel> x = [];

  getTodoMessage(GetTodoMessage event, Emitter<TodoMessageState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: FormStatus.success, messages: x));
  }

  sendTodoMessage(SendTodoMessage event, Emitter<TodoMessageState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));
    x.add(event.todoMessageModel);
    emit(state.copyWith(status: FormStatus.success, messages: x));
    add(GetTodoMessage());
  }
}
