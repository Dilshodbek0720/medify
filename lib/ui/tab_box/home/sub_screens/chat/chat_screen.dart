import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/blocs/messages/message_bloc.dart';
import 'package:medify/blocs/messages/message_event.dart';
import 'package:medify/blocs/messages/message_state.dart';
import 'package:medify/data/models/message/message_model.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/chat_dialog.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/messages_listview.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/send_message_textfield.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ImagePicker picker = ImagePicker();

  String value = '';

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_outlined),
            ),
            10.pw,
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Image.asset(
                AppIcons.drWatson,
                width: 40.w,
              ),
            ),
            10.pw,
            Text('Daniel Austin', style: AppTextStyle.h4Bold.copyWith(color: AppColors.c_900)),
          ],
        ),
        actions: [
          getIcon(
            AppIcons.call,
            context: context,
            onTap: () {},
          ),
          getIcon(
            AppIcons.moreCircle,
            context: context,
            onTap: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(AppIcons.chatBackground, fit: BoxFit.fill)),
          BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: state.messages.isNotEmpty
                        ? MessagesListView(messages: state.messages)
                        : Center(
                            child: Text(
                              tr('there_are_posts'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.black,
                                  ),
                            ),
                          ),
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SendMessageTextField(
                        onSuffixIconTap: () {
                          chatDialog(context, picker: picker);
                        },
                        onChanged: (v) {
                          setState(() {
                            value = v;
                          });
                        },
                        onSendTap: () {
                          context.read<MessageBloc>().add(
                                SendMessage(
                                    messageModel: MessageModel(
                                  receiverName: '',
                                  senderName: '',
                                  dateTime: DateTime.now().toString().substring(10, 16),
                                  message: value,
                                )),
                              );
                          value = '';
                          controller.clear();
                        },
                        controller: controller,
                        value: value,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
