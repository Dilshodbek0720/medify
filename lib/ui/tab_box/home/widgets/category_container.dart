import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/help_center/help_center_category_cubit.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/fonts/text_styles.dart';

class CategoryContainer extends StatelessWidget {
  final String name;
  final String selectedName;
  final bool isSelected;

  const CategoryContainer({
    Key? key,
    required this.name,
    required this.selectedName,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryCubit = BlocProvider.of<HelpCenterCategoryCubit>(context);

    return InkWell(
      borderRadius: BorderRadius.circular(100.r),
      onTap: () {
        categoryCubit.selectCategory(name);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: AppColors.primary500, width: 2.w),
          color: isSelected
              ? AppColors.primary500
              : AppColors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Text(
          name,
          style: AppTextStyle.bodyLargeBold!.copyWith(
            color: isSelected ? AppColors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}