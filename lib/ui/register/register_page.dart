import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/register/register_screen.dart';
import 'package:medify/ui/register/verify/verify_screen.dart';
import 'package:medify/ui/register/verify/verify_with.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 8.h,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: pageIndex >= 0
                            ? AppColors.primary
                            : AppColors.cA6A9AB,
                        borderRadius: BorderRadius.circular(100.r))),
              ),
            ),
            10.pw,
            Expanded(
              child: SizedBox(
                height: 8.h,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: pageIndex >= 1
                            ? AppColors.primary
                            : AppColors.cA6A9AB,
                        borderRadius: BorderRadius.circular(100.r))),
              ),
            ),
            10.pw,
            Expanded(
              child: SizedBox(
                height: 8.h,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: pageIndex == 2
                            ? AppColors.primary
                            : AppColors.cA6A9AB,
                        borderRadius: BorderRadius.circular(100.r))),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            RegisterScreen(
              onTapLeft: () {
                Navigator.pop(context);
              },
              onTapRight: () {
                pageIndex += 1;
                pageController.animateToPage(
                  pageIndex,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear,
                );
                setState(() {});
              },
            ),
            VerifyWithScreen(
              onTapLeft: () {
                pageIndex -= 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              onTapRight: () {
                // context.read<CodeInputCubit>().resendCode();
                pageIndex += 1;
                pageController.animateToPage(
                  pageIndex,
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear,
                );
                setState(() {});
              },
            ),
            VerifyScreen(
              onTapLeft: () {
                pageIndex -= 1;
                setState(() {
                  pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.linear,
                  );
                });
              },
              onTapRight: () {
                Navigator.pushNamed(context, RouteNames.enterPinScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
