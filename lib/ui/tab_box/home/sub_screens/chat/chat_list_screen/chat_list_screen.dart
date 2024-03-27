import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/chat_list_screen/widgets/chat_person_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/chat_list_screen/widgets/chat_screen_textfield.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  bool isSelectedSearch = false;

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
          Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: getIcon(AppIcons.arrowLeft, color: AppColors.c_900, context: context, onTap: (){
            Navigator.pop(context);
          }),),
              isSelectedSearch ? Expanded(child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 20.w, top: 16.h, bottom: 6.h),
                child: ChatScreenTextField(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          isSelectedSearch = false;
                        });
                      },
                      icon: Icon(Icons.cancel_outlined, color: AppColors.primary400.withOpacity(0.7),)),
                  hintText: 'Поиск', fillColor: AppColors.white, borderColor: AppColors.c_400,
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 2.h,),),
              )) : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h, bottom: 6.h),
                child: Row(
                  children: [
                    Text("Chat", style: AppTextStyle.h4Bold.copyWith(color: AppColors.c_900, ),),
                    SizedBox(width: MediaQuery.of(context).size.width/2,),
                    getIcon(AppIcons.search, context: context, onTap: () {
                      setState(() {
                        isSelectedSearch = true;
                      });
                    }),
                  ],
                ),
              )
            ],
          ),
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