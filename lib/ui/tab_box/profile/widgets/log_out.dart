import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/size/size_extension.dart';

class LogOutItem extends StatelessWidget {
  const LogOutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            12.ph,
            Text(
             tr('log_out'),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.error),
            ),
            24.ph,
            const Divider(),
            24.ph,
            Text(
              "${tr('are_you_log_out')}?",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.ph,
            Row(
              children: [
                Expanded(
                    child: GlobalButton(
                  textColor: AppColors.primary,
                  title:tr('cancel'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: AppColors.primary100,
                  radius: 100.r,
                )),
                12.pw,
                Expanded(
                    child: GlobalButton(
                  title: tr('yes_log_out'),
                  onTap: () async {
                    await StorageRepository.deleteString(
                      StorageKeys.userToken
                    );
                    Navigator.pushNamed(context, RouteNames.signInScreen);
                  },
                  radius: 100.r, color: AppColors.primary, textColor: Colors.white,
                )),
              ],
            ),
            48.ph,
          ],
        ),
      ),
    );
  }
}
