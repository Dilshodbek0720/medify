import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerItem extends StatefulWidget {
  const OwnerItem({super.key});

  @override
  State<OwnerItem> createState() => _OwnerItemState();
}

class _OwnerItemState extends State<OwnerItem> {
  bool _hasCallSupport = false;
  Future<void>? _launched;

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '+998998999739')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Row(
        children: [
          SizedBox(
            height: 60.w,
            width: 60.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.r),
                child: GestureDetector(
                    onTap: () {}, child: Image.asset(AppIcons.drWatson))),
          ),
          16.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Natasya Wilodra",
                style: TextStyle(
                  color: AppColors.c_900,
                  fontSize: 18.sp,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              4.ph,
              Text(
                "Owner",
                style: TextStyle(
                    color: AppColors.c_700,
                    fontSize: 14.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2),
              )
            ],
          ),
          const Spacer(),
          getIcon(AppIcons.chat, context: context, color: AppColors.primary500,
              onTap: () {
            Navigator.pushNamed(context, RouteNames.askQuestionScreen);
          }),
          getIcon(AppIcons.call,
              context: context,
              color: AppColors.primary500,
              onTap: _hasCallSupport
                  ? () => setState(() {
                        _launched = _makePhoneCall("+998998999739");
                      })
                  : null),
          FutureBuilder<void>(future: _launched, builder: _launchStatus),
        ],
      ),
    );
  }
}
