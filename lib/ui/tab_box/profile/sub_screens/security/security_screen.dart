import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/security_cubit/security_cubit.dart';
import 'package:medify/ui/tab_box/profile/widgets/switcher_listtile.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Security'),
      body: BlocBuilder<SecurityCubit, SecurityState>(
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ...List.generate(state.securityNames.length, (index) {
                String securityName = state.securityNames[index];
                bool value = state.securityValues[index];

                return SwitcherListTile(
                  isSwitched: value,
                  onTap: () {
                    context
                        .read<SecurityCubit>()
                        .updateSecurityValues(securityName, !value, state.securityNames);
                  },
                  text: securityName,
                );
              }),
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.all(24.w),
                title:  Text('Google Authenticator', style: TextStyle(
                  color: AppColors.c_900,
                  fontSize: 18.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.20,
                ),),
                trailing: SvgPicture.asset(
                  AppIcons.arrowRight2,
                  colorFilter: const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),
                ),
              ),
              GlobalButton(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                title: 'Change PIN',
                onTap: () {},
                radius: 100.r,
                color: AppColors.primary100,
                textColor: AppColors.primary500,
              ),
              24.ph,
              GlobalButton(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                title: 'Change Password',
                onTap: () {},
                radius: 100.r,
                color: AppColors.primary100,
                textColor: AppColors.primary500,
              ),
            ],
          );
        },
      ),
    );
  }
}