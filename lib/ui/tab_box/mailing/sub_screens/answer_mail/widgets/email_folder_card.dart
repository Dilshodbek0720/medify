import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class EmailFolderCard extends StatelessWidget {
  const EmailFolderCard({super.key, required this.folder});
  final String folder;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              children: [
                SizedBox(
                  height: 24.w,
                  width: 24.w,
                  child: SvgPicture.asset(AppIcons.paper),
                ),
                20.pw,
                Text(folder.substring(folder.length-23)),
                const Spacer(),
                GestureDetector(
                  onTap: (){ },
                  child: SizedBox(
                    height: 24.w,
                    width: 24.w,
                    child: SvgPicture.asset(AppIcons.cancel),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
