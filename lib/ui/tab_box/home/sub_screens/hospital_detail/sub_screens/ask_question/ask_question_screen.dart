import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({super.key});

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  var phoneFormatter = MaskTextInputFormatter(
      initialText: "",
      mask: '## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')});
  TextEditingController phoneController = TextEditingController(text: "94 986 08 99");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Ask question',
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                12.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    height: 60.h,
                    child: GlobalTextField(
                      fillColor: AppColors.white,
                      borderColor: AppColors.c_700,
                      radius: 12,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      hintText: "Write ask question..",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                20.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    height: 60.h,
                    child: GlobalTextField(
                      radius: 12,
                      fillColor: AppColors.white,
                      borderColor: AppColors.c_500,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      controller: phoneController,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                      maskFormatter: phoneFormatter,
                      prefixIcon: SizedBox(
                        width: 60.w,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 6.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "+998",
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    height: 20 / 14,
                                    color: AppColors.c_900,
                                    fontSize: 17.sp, fontWeight: FontWeight.w400),
                              ),
                              6.pw,
                            ],
                          ),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: GestureDetector(
                          onTap: (){
                            phoneController.text = "";
                          },
                          child: SvgPicture.asset(AppIcons.cancel,
                              colorFilter: ColorFilter.mode(AppColors.c_700, BlendMode.srcIn)),
                        ),
                      ),
                      onChanged: (phone) {
                      },
                      hintText: "Phone",
                    ),
                  ),
                ),
              ],
            ),
          ),
          GlobalButton(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            onTap: () {
              Navigator.pop(context);
              Fluttertoast.showToast(
                  msg: "This question is successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: AppColors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
              );
            },
            title: "Ask question",
            radius: 100,
            color: AppColors.primary,
            textColor: AppColors.white,
          ),
          48.ph
        ],
      ),
    );
  }
}
