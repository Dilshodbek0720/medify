import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/help_center/help_center_category_cubit.dart';
import 'package:medify/ui/tab_box/home/widgets/category_container.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCenterCategoryCubit, String>(
      builder: (context, selectedCategory) {
        return SizedBox(
          height: 38,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(
                categories.length,
                    (index) => CategoryContainer(
                  name: categories[index],
                  selectedName: selectedCategory,
                  isSelected: categories[index] == selectedCategory,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> categories = [
  "All",
  "General",
  "Dentist",
  "Nutritionist",
];