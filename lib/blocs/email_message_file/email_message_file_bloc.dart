import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/blocs/messages/message_event.dart';
import 'package:medify/data/models/message/message_model.dart';
import 'package:medify/data/models/status/form_status.dart';

import 'email_message_file_event.dart';
import 'email_message_file_state.dart';

class EmailMessageFileBloc extends Bloc<EmailMessageFileEvent, EmailMessageFileState> {
  EmailMessageFileBloc()
      : super(
    EmailMessageFileState(
        message: MessageModel(
          receiverName: '',
          senderName: '',
          dateTime: '',
        ),
        messages: const [],
        errorText: '',
        status: FormStatus.pure),
  ) {
    on<GetEmailMessageFile>(getMessage);
    on<SendEmailMessageFile>(sendMessage);
  }

  List<MessageModel> x = [];

  getMessage(GetEmailMessageFile event, Emitter<EmailMessageFileState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: FormStatus.success, messages: x));
  }

  sendMessage(SendEmailMessageFile event, Emitter<EmailMessageFileState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));
    x.add(event.messageModel);
    emit(state.copyWith(status: FormStatus.success, messages: x));
    add(GetEmailMessageFile());
  }
}
