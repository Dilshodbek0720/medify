import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat_list_screen/widgets/chat_person_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat_list_screen/widgets/chat_screen_textfield.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: ChatScreenTextField(hintText: 'Поиск', fillColor: AppColors.c_200, borderColor: AppColors.c_400, contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h,),),
            ),
            const Divider(height: 1,color: Color(0xFF314356)),
            Expanded(
                child: ListView(
                  children: [
                    ...List.generate(10, (index) => const ChatPersonCard(index: 0, name: 'Danial Siddiki', description: 'Текст сообщения для карточки чата с анонсом.', date: '08:28', count: '1',))
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
