import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';

class SwitcherListTile extends StatelessWidget {
  const SwitcherListTile({
    super.key,
    required this.isSwitched,
    required this.onTap,
    required this.text,
  });

  final bool isSwitched;
  final VoidCallback onTap;
  final String text;

  State<SwitcherListTile> createState() => _SwitcherListTileState();
}

class _SwitcherListTileState extends State<SwitcherListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      contentPadding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 24.w,
      ),
      title: Text(widget.text, style: TextStyle(
        color: AppColors.c_900,
        fontSize: 18.sp,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w600,
        letterSpacing: 0.20,
      ),),
      trailing: CupertinoSwitch(
        activeColor: AppColors.primary,
        value: widget.isSwitched,
        onChanged: (v) {
//           setState(() {
//             widget.isSwitched = v;
//             context
//                 .read<SecurityCubit>()
//                 .updateSecurityValues(widget.text, v, securityKeys);
//           });
        },
      ),
    );
  }
}
