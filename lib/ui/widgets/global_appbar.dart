import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  const GlobalAppBar({
    super.key,
    this.onTap,
    this.action,
    this.centerTitle,
    this.title = "",
    this.background = Colors.white,
    this.automaticallyImplyLeading = true,
  });

  final VoidCallback? onTap;
  final String title;
  final List<Widget>? action;
  final bool? centerTitle;
  final Color background;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
      backgroundColor: background,
      scrolledUnderElevation: 0,
      actions: action,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      leading: onTap != null ? Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: getIcon(AppIcons.arrowLeft, context: context, onTap: onTap),
      ) : null,
      title:
      title.isNotEmpty ? Text(title, style: AppTextStyle.h4Bold.copyWith(color: AppColors.c_900)) : null,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}