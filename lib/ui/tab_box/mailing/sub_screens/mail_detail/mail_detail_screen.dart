import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/mailing/widgets/answer_button.dart';
import 'package:medify/ui/tab_box/mailing/widgets/file_widget.dart';
import 'package:medify/ui/tab_box/mailing/widgets/mail_detail_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class MailDetailScreen extends StatefulWidget {
  const MailDetailScreen({super.key});

  @override
  State<MailDetailScreen> createState() => _MailDetailScreenState();
}

class _MailDetailScreenState extends State<MailDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        action: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){ }),
          10.pw,
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(
                        horizontal: 24.w
                    ),
                      child: Text('Hi, praesent posuere feugiat hendrerit', style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Urbanist',
                        color: AppColors.c_900,
                      ),),
                    ),
                    16.ph,
                    MailDetailCard(image: AppIcons.drWatson, title: 'Benjamin Evalent', description: 'July 17', onTapStar: (){ }, onTap: (){ }),
                    16.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text('Duis ut ultricies elit, in dictum est. Duis vel tortor non est facilisis molestie. Quisque commodo and a varius elit, sed rutrum lorem cursus et. \n\n Vestibulum porttitor nunc non ligula vestibulum on gravida. Morbi pretium volutpat dolor, sit amet two ultricies turpis feugiat vel. Ut tortor felis, mail one consequat quis risus id, consequat been dignissim purus. Morbi eu dolor sed metus gravida dictum eu sagittis eros. Nulla ultricies urna mi, non a congue tellus lobortis sed. Quisque sagittis purus an quis odio tristique consequat. Suspendisse ullamcorpe. Curabitur bibendum malesuada augue, ornare mail bibendum metus dapibus nec. Vestibulum address hendrerit orci nec velit eleifend, et gravida sapien ornare. Fusce vulputate, erat non euismo Benjamin bibendum, nisi libero pretium ligula, quis efficitur risus eros non purus. Vestibulum facilisis ex ligula, at vulputate purus placerat vel and you mail. ', style: TextStyle(
                          fontFamily: "Urbanist",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.c_500
                      ),),
                    ),
                    24.ph,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Wrap(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: FileWidget(onTap: () {  }, fileName: 'Resume', fileFormat:'WORD', fileIcon: AppIcons.word,),
                        ),
                        16.pw,
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: FileWidget(onTap: () {  }, fileName: 'Presentation', fileFormat: 'PPTX', fileIcon: AppIcons.pptx,),
                        ),
                        16.pw,
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: FileWidget(onTap: () {  }, fileName: 'About Me', fileFormat: 'PPTX', fileIcon: AppIcons.pptx),
                        ),
                      ],),
                    ),
                  ],
                ),
              )
          ),
          Container(
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              bottom: 36.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerButton(onTap: (){
                  Navigator.pushNamed(context, RouteNames.answerMailScreen);
                }, title: 'Answer', icon: AppIcons.answer, color: AppColors.primary, textColor: AppColors.c_900,),
                18.pw,
                AnswerButton(onTap: (){ }, title: 'Forward', icon: AppIcons.forward, color: AppColors.primary, textColor: AppColors.c_900,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
