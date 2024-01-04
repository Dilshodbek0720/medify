import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/enterence/onboarding/widgets/page_view_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark),
        actions: [
          pageIndex == 3 ? const SizedBox() : TextButton(onPressed: (){
            pageIndex = 3;
            setState(() {
              pageController.animateToPage(
                pageIndex,
                duration: const Duration(milliseconds: 1),
                curve: Curves.linear,
              );
            });
          }, child: const Text("Skip")),
          10.pw,
        ],
      ),
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PageViewItem(
              title: "Discover Experienced Doctors",
              img: AppIcons.onBoarding1,
              leftOnTap: () async {
              },
              rightOnTap: () async {
                pageIndex += 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              pageIndex: pageIndex,
            ),
            PageViewItem(
              title: "Effortless Appointment Booking",
              img: AppIcons.onBoarding2,
              leftOnTap: () async {
                pageIndex -= 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              rightOnTap: () async {
                pageIndex += 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              pageIndex: pageIndex,
            ),
            PageViewItem(
              title: "Learn About Your Doctors",
              img: AppIcons.onBoarding3,
              leftOnTap: () async {
                pageIndex -= 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              rightOnTap: () async {
                pageIndex += 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              pageIndex: pageIndex,
            ),
            PageViewItem(
              title:
                  "Streamline Your Health and Wellness",
              img: AppIcons.onBoarding4,
              leftOnTap: () async {
                pageIndex -= 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              rightOnTap: () async {
                Navigator.pushNamed(context, RouteNames.letsInScreen);
              },
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              pageIndex: pageIndex,
            ),
          ],
        ),
      ),
    );
  }
}
