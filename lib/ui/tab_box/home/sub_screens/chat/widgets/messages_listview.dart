import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/models/message/message_model.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/audio_container.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/image_container.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/message_container.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key, required this.messages});

  final List<MessageModel> messages;

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        ...List.generate(
          messages.length,
          (index) {
            MessageModel message = messages.reversed.toList()[index];
            print(message.dateTime);
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    message.image == null && message.message == null
                        ? AudioContainer(audioPath: message.voice ?? '')
                        : message.image == null
                            ? Flexible(
                                child: MessageContainer(
                                  index: index,
                                  message: message.message!,
                                  dateTime: message.dateTime,
                                ),
                              )
                            : ImageContainer(
                                images: message.image ?? [],
                                dateTime: message.dateTime,
                              ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
