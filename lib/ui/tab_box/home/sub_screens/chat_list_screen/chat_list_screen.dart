import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat_list_screen/widgets/chat_person_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat_list_screen/widgets/chat_screen_textfield.dart';
import 'package:medify/utils/colors/app_colors.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_outlined)),
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: ChatScreenTextField(hintText: 'Поиск', fillColor: AppColors.c_200, borderColor: AppColors.c_400, contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h,),),
              )),
            ],
          ),
          const Divider(height: 1,color: Color(0xFF314356)),
          Expanded(
              child: ListView(
                children: [
                  ...List.generate(10, (index) => ChatPersonCard(index: 0, name: 'Danial Siddiki', description: 'Текст сообщения для карточки чата с анонсом.', date: '08:28', count: '1', onTap: () {
                    Navigator.pushNamed(context, RouteNames.chatScreen);
                  },))
                ],
              )
          )
        ],
      ),
    );
  }
}