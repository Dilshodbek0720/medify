import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/onboarding/widgets/page_view_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

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
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.white
        ),
      ),
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          controller: pageController,
          physics: const ScrollPhysics(),
          children: [
            PageViewItem(
              title: "Thousands of doctors & experts to help your health!",
              img: AppIcons.onBoarding1,
              onTap: () async {
                pageIndex+=1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              pageIndex: pageIndex,
            ),
            PageViewItem(
              title: "Health checks & consultations easily anywhere anytime",
              img: AppIcons.onBoarding2,
              onTap: () async {
                pageIndex+=1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              pageIndex: pageIndex,
            ),
            PageViewItem(
              title: "Let's start living healthy and well with us right now!",
              img: AppIcons.onBoarding3,
              onTap: () async {
                pageIndex+=1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              pageIndex: pageIndex,
            ),
            PageViewItem(
              title: "Streamline Your Health and Wellness: Book appointments, consult doctors online, manage events - all in one app.",
              img: AppIcons.onBoarding4,
              onTap: () async {
                Navigator.pushNamed(context, RouteNames.letsInScreen);
              },
              pageIndex: pageIndex,
            ),
          ],
        ),
      ),
    );
  }
}