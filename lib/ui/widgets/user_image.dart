import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/register/widgets/profile_dialog.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            profileDialog(
                context: context,
                valueChanged: (v) {
                  // context.read<RegisterCubit>().updateFile(File(v));
                });
          },
          child: Stack(children: [
            Image.asset(
              AppIcons.avatar,
              width: 150.w,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                AppIcons.getSvg(
                  name: AppIcons.editSquare,
                  iconType: IconType.bold,
                ),
                width: 30.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
