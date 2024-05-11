import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class NewCommentScreen extends StatefulWidget {
  const NewCommentScreen({super.key});

  @override
  State<NewCommentScreen> createState() => _NewCommentScreenState();
}

class _NewCommentScreenState extends State<NewCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'Write New Comment',
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
                      hintText: "New comment",
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                )
              ],
            ),
          ),
          GlobalButton(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            onTap: () {

            },
            title: "Add New Comment",
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
