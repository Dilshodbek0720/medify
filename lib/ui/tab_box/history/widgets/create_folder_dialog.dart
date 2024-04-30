import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

void createFolderDialog({required BuildContext context}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context,state){
          String folderName = '';
          return AlertDialog(
            backgroundColor: const Color(0xFFEFF2FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New folder', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp
                  ),),
                  20.ph,
                  TextField(
                    onTapOutside: (event) {
                      // FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: (v){
                      folderName = v;
                      // state((){
                      // });
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      labelStyle: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_900,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_500,
                      ),
                      hintText: "New folder",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                          borderRadius: BorderRadius.circular(4.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      fillColor: const Color(0xFFEFF2FB),
                      filled: true,
                    ),
                    style: TextStyle(color: AppColors.dark3, fontSize: 16.sp, fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Bekor qilish",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 16.sp,
                      color: AppColors.primary
                  ),
                ),
              ),
              TextButton(
                onPressed: folderName == '' ? null : (){

                },
                child: Text(
                  "Create",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 16.sp,
                      color: folderName == '' ? AppColors.primary400.withOpacity(0.8) : AppColors.primary
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}