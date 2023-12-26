import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/code_input_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/code_input_field.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/screen_size.dart';

class ConfirmCodeScreen extends StatelessWidget {
  const ConfirmCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CodeInputCubit>().setContext(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlobalAppBar(
        title: "OTP Code Verification",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 24 / figmaWidth,
          right: width * 24 / figmaWidth,
          top: 24 * height / figmaHeight,
          bottom: 40 * height / figmaHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const CodeInputField(),
            const Spacer(),
            GlobalButton(
              title: "Verify",
              radius: 100.r,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.createPassword);
              }, color: AppColors.primary,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}