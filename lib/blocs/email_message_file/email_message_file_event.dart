import 'package:equatable/equatable.dart';
import 'package:medify/data/models/message/message_model.dart';

abstract class EmailMessageFileEvent extends Equatable {}

class SendEmailMessageFile extends EmailMessageFileEvent {
  final MessageModel messageModel;

  SendEmailMessageFile({required this.messageModel});
  @override
  List<Object?> get props => [messageModel];
}

class GetEmailMessageFile extends EmailMessageFileEvent {
  @override
  List<Object?> get props => [];
}
