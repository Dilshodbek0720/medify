import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/chat_profile_appbar.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/profile_image_card.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ChatProfileScreen extends StatefulWidget {
  const ChatProfileScreen({super.key});

  @override
  State<ChatProfileScreen> createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: ChatProfileAppBar(
          onTap: (){
            Navigator.pop(context);
          },
          background: AppColors.primary400.withOpacity(0.8),
          action: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, RouteNames.meetScreen);
            }, icon: const Icon(Icons.videocam, color: AppColors.white,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.call, color: AppColors.white,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: AppColors.white,))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            ProfileImageCard(onTap: (){

            },
            icon: const Icon(Icons.chat_outlined, color: AppColors.c_500,),
              userName: "Dilshodbek Sayitqulov",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+998 949860899",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.c_900),
                  ),
                  2.ph,
                  Text(
                    "Mobile",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.c_600),
                  ),
                ],
              )
            ),
            16.ph,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "My channel! ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.c_900),
                        ),
                        Text(
                          "@dilshodbeksayitqulov",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary),
                        ),
                      ],
                    ),
                    2.ph,
                    Text(
                      "Bio",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_600),
                    ),
                  ],
                )
            ),
            16.ph,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "@Dilshodbek_0720",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.c_900),
                    ),
                    2.ph,
                    Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.c_600),
                    ),
                  ],
                )
            ),
            8.ph,
            const Divider(
              height: 1,
              color: AppColors.c_400,
            ),
            8.ph,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.c_900),
                        ),
                        2.ph,
                        Text(
                          "Отключены",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.c_600),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Switch(
                      activeColor: AppColors.primary,
                      value: isSwitched,
                      onChanged: (v) {
                        setState(() {
                          isSwitched=isSwitched?false:true;
                        });
                      },
                    ),
                  ],
                )
            ),
            10.ph,
            Container(
              height: 12.h,
              color: AppColors.c_200,
            ),
            SizedBox(
                height:50.h,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white
                  ),
                  child: TabBar(
                      isScrollable: true,
                      labelColor: AppColors.c_900,
                      unselectedLabelColor: AppColors.c_500,
                      tabAlignment: TabAlignment.center,
                      indicatorWeight: 4,
                      indicatorColor: AppColors.primary,
                      labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Urbanist'),
                      tabs: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.4,
                            child: const Tab(text: "Media")),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.4,
                            child: const Tab(text: "File")),
                      ],
                  ),
                ),),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: TabBarView(children: [
                Center(
                  child: Text("Media",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
                Center(
                  child: Text("File",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Urbanist'),),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
