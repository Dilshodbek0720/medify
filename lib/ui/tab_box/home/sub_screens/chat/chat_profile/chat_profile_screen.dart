import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/chat_profile_appbar.dart';
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
            IconButton(onPressed: (){}, icon: const Icon(Icons.videocam, color: AppColors.white,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.call, color: AppColors.white,)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: AppColors.white,))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 28.r),
                  color: AppColors.primary400.withOpacity(0.8),
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    bottom: 24.h,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: SizedBox(
                          width: 70.r,
                          height: 70.r,
                          child: Image.asset(AppIcons.profileChat, fit: BoxFit.cover),),),
                      24.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dilshodbek Sayitqulov",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          5.ph,
                          Text(
                            "Yaqinda onlain edi",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 24.w,
                  bottom: 0,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: AppColors.c_300)
                    ),
                    child: SizedBox(
                      width: 30.r,
                      height: 30.r,
                      child: const Icon(Icons.chat_outlined, color: AppColors.c_500,),
                    ),),
                  ),)
              ],
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
                      tabs: const <Widget>[
                        Tab(text: "Media"),
                        Tab(text: "File"),
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