import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/sub_screens/about_medify/widgets/about_benefit_text.dart';
import 'package:medify/ui/tab_box/home/sub_screens/about_medify/widgets/about_card.dart';
import 'package:medify/ui/tab_box/home/sub_screens/about_medify/widgets/about_checked_text.dart';
import 'package:medify/ui/tab_box/home/sub_screens/about_medify/widgets/about_medify_text_style.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class AboutMedifyScreen extends StatefulWidget {
  const AboutMedifyScreen({super.key});

  @override
  State<AboutMedifyScreen> createState() => _AboutMedifyScreenState();
}

class _AboutMedifyScreenState extends State<AboutMedifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: 'About Medify',
      ),
      body: ListView(
        children: [
          12.ph,
          const AboutMedifyTextStyle(text1: 'European Doctors ', text2: 'Online',),
          16.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_900,
                  fontSize: 16.sp),
            ),
          ),
          16.ph,
          const AboutMedifyTextStyle(text1: 'Organization of ', text2: 'Medical Treatment Abroad',),
          16.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy!",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_900,
                  fontSize: 16.sp),
            ),
          ),
          16.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("At Medify, we focus on:",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.c_900,
                  fontSize: 16.sp),
            ),
          ),
          6.ph,
          const AboutCheckedText(title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
          const AboutCheckedText(title: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum,"),
          6.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Your Benefits:",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.c_900,
                  fontSize: 16.sp),
            ),
          ),
          6.ph,
          const AboutBenefitText(title: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text."),
          const AboutBenefitText(title: "We provide many variations of passages of Lorem Ipsum available"),
          const AboutBenefitText(title: "Our many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour."),
          const AboutBenefitText(title: "If necessary, many variations of passages of Lorem Ipsum available,"),
          6.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy! many variations of passages of Lorem Ipsum available.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_900,
                  fontSize: 16.sp),
            ),
          ),
          16.ph,
          DecoratedBox(decoration: const BoxDecoration(
            color: Color(0xFFF2F4FF)
          ),
          child: Column(
            children: [
              16.ph,
              const AboutMedifyTextStyle(text1: 'Achieving Succes in ', text2: 'Telemedicine',),
              16.ph,
              Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy! many variations of passages of Lorem Ipsum available. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy! many variations of passages of Lorem Ipsum available. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's manner",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.c_900,
                      fontSize: 16.sp),
                ),
              ),
              10.ph,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    24.pw,
                    Padding(
                      padding: EdgeInsets.all(6.r),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: (){},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width/2.4,
                            width: MediaQuery.of(context).size.width/2.4,
                            child: Image.asset(AppIcons.hospital, fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                    16.pw,
                    Padding(
                      padding: EdgeInsets.all(6.r),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: (){},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width/2.4,
                            width: MediaQuery.of(context).size.width/2.4,
                            child: Image.asset(AppIcons.hospital, fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                    16.pw,
                    Padding(
                      padding: EdgeInsets.all(6.r),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: (){},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width/2.4,
                            width: MediaQuery.of(context).size.width/2.4,
                            child: Image.asset(AppIcons.hospital, fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                    ),
                    24.pw,
                  ],
                ),
              ),
              24.ph,
            ],
          ),
          ),
          16.ph,
          const AboutMedifyTextStyle(text1: 'Our ', text2: 'Vision',),
          16.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text("Lorem Ipsum has been the industry's standard dummy! many variations of passages of Lorem Ipsum available. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's manner",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.c_900,
                  fontSize: 16.sp),
            ),
          ),
          24.ph,
          Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width/2.4,
                    width: MediaQuery.of(context).size.width/3,
                    child: Image.asset(AppIcons.drWatson, fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width/4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/6),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width/2.4,
                      width: MediaQuery.of(context).size.width/3,
                      child: Image.asset(AppIcons.doctorCardImage, fit: BoxFit.cover,),
                    ),
                  ),
                ),
              ],
            )
          ),
          24.ph,
          DecoratedBox(decoration: const BoxDecoration(
              color: Color(0xFF19212C)
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                36.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: RichText(
                    text: TextSpan(
                      text: 'What makes us ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                          fontSize: 26.sp),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'different',
                          style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.green),
                        ),
                      ],
                    ),
                  ),
                ),
                16.ph,
                Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                        fontSize: 16.sp),
                  ),
                ),
                16.ph,
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.width/2,
                    child: Image.asset(AppIcons.aboutImage),
                  ),
                ),
                16.ph,
                const AboutCard(title: '15+ Years of Experience in the Organization of Medical Treatment', icon: Icon(Icons.person, color: AppColors.white,)),
                const AboutCard(title: 'Acknowledged doctors from Europa (Autralia, Germany and Switzerland)', icon: Icon(Icons.person, color: AppColors.white,)),
                const AboutCard(title: 'Built-In Video Call with Patient Card Information', icon: Icon(Icons.videocam, color: AppColors.white,)),
                const AboutCard(title: 'Direct Communication (Chat with your doctor)', icon: Icon(Icons.chat_rounded, color: AppColors.white,)),
                const AboutCard(title: 'Built-In Chat Translation', icon: Icon(Icons.g_translate, color: AppColors.white,)),
                const AboutCard(title: 'Online Interpreter during Video Call', icon: Icon(Icons.person, color: AppColors.white,)),
                const AboutCard(title: 'Data Protection Through Encryption', icon: Icon(Icons.check_box_outlined, color: AppColors.white,)),
                const AboutCard(title: 'Mobile App Available for App and Google Store', icon: Icon(Icons.cloud_download, color: AppColors.white,)),
                36.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
