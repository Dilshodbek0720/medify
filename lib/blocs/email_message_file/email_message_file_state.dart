import 'package:equatable/equatable.dart';
import 'package:medify/data/models/message/message_model.dart';
import 'package:medify/data/models/status/form_status.dart';

class EmailMessageFileState extends Equatable {
  final MessageModel message;
  final List<MessageModel> messages;
  final String errorText;
  final FormStatus status;

  const EmailMessageFileState({
    required this.message,
    required this.messages,
    required this.errorText,
    required this.status,
  });

  EmailMessageFileState copyWith({
    MessageModel? message,
    List<MessageModel>? messages,
    String? errorText,
    FormStatus? status,
  }) =>
      EmailMessageFileState(
        message: message ?? this.message,
        messages: messages ?? this.messages,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [message, messages, errorText, status];
}
