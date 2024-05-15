import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ProfileSliverAppBar extends StatelessWidget {
  const ProfileSliverAppBar({
    required this.avatar,
    required this.title,
    this.extent = 250,
    super.key,
  });

  final Widget avatar;
  final double extent;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _ProfileSliverAppBarDelegate(
        avatar: avatar,
        title: title,
        extent: extent > 200 ? extent : 200,
      ),
    );
  }
}

class _ProfileSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _ProfileSliverAppBarDelegate({required this.avatar, required this.title, this.extent = 250})
      : assert(extent >= 200, '');

  final Widget avatar;
  final double extent;
  final String title;

  final _avatarAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topLeft);
  final _iconAlignTween = AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topRight);
  final _titleMarginTween = EdgeInsetsTween(
    begin: EdgeInsets.only(left: 24.w,bottom: 20.h),
    end: EdgeInsets.only(left: 30.w, top: 10),
  );

  final _iconMarginTween = EdgeInsetsTween(
    begin: EdgeInsets.only(bottom: 124.h, top: 16.h),
    end: EdgeInsets.only(bottom: 124.h, top: 16.h),
  );

  @override
  double get maxExtent => 160;

  @override
  double get minExtent => 70.h;

  @override
  bool shouldRebuild(_ProfileSliverAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar || title != oldDelegate.title;
  }

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    const tempVal = 160 * 72 / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    final titleMargin = _titleMarginTween.lerp(progress);
    final iconMargin = _iconMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);
    final iconAlign = _iconAlignTween.lerp(progress);

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 70,
          constraints: BoxConstraints(maxHeight: minExtent),
          color: AppColors.primary400,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: progress < 0.5 ? 160 * (1 - progress) * 1.5 : 0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary400,
                  AppColors.primary400,
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: titleMargin,
          child: Align(
            alignment: avatarAlign,
            child: Row(
              children: [
                SizedBox(
                  width: 85.r-28*progress,
                  height: 85.r-28*progress,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(AppIcons.profileChat, fit: BoxFit.cover),),),
                (20-10*progress).pw,
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: iconMargin,
          child: Align(
            alignment: iconAlign,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: ()async{

                }, icon: const Icon(Icons.search, color: AppColors.white,),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert, color: AppColors.white,),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}