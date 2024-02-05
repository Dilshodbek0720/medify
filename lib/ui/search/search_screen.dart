import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/search/widgets/filter.dart';
import 'package:medify/ui/search/widgets/search_categories_item.dart';
import 'package:medify/ui/search/widgets/symptoms_button.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> categories = ['Doctors', 'Hospitals', 'Symptoms'];
  int selectType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: const Color(0xFFF7F7F7),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: getIcon(AppIcons.arrowLeft, context: context, onTap: () {
            Navigator.pop(context);
          }),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 14.h, right: 8.w),
          child: GlobalTextField(
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
            fillColor: AppColors.c_100,
            borderColor: AppColors.c_300,
            suffixIcon: IconButton(
              splashRadius: 20,
              onPressed: () {
                showBottomSheetWidget(context);
              },
              icon: SvgPicture.asset(
                  AppIcons.getSvg(
                      name: AppIcons.filter, iconType: IconType.bold),
                  colorFilter: const ColorFilter.mode(
                      AppColors.primary500, BlendMode.srcIn)),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SvgPicture.asset(AppIcons.search,
                  colorFilter:
                      const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn)),
            ),
            hintText: "Search",
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            10.ph,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                    categories.length,
                    (index) => SearchCategoriesItem(
                      onTap: () {
                        selectType = index;
                        setState(() {});
                      },
                      index: index,
                      selectType: selectType,
                      categoryName: categories[index],
                    ),
                  )
                ],
              ),
            ),
            6.ph,
            selectType == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0 Found",
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.c_900,
                        ),
                      ),
                      TextButton(
                          child: Row(
                            children: [
                              Text(
                                "Default",
                                style: TextStyle(
                                  fontFamily: "Urbanist",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary500,
                                ),
                              ),
                              12.pw,
                              SvgPicture.asset(AppIcons.swap,
                                  width: 20,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.primary500, BlendMode.srcIn)),
                            ],
                          ),
                          onPressed: () {}),
                    ],
                  )
                : const SizedBox(),
            // const NotFoundWidget()
            Expanded(
              child: selectType == 0
                  ? ListView(
                      children: [
                        ...List.generate(
                            10,
                            (index) => DoctorsCard(
                                  index: index,
                                  name: 'Dr. Jenny Watson',
                                  category: 'Immunologists',
                                  hospital: 'Christ Hospital',
                                  rating: '4.4',
                                  views: '4,942',
                                ))
                      ],
                    )
                  : selectType == 1
                      ? const SizedBox()
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                              // border: Border.all(color: AppColors.c_300),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.r)),
                          child: ListView(
                            children: [
                              ...List.generate(
                                symptoms.length,
                                (index) => index == 0
                                    ? SymptomsButton(
                                        text: symptoms[index],
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.r),
                                            topRight: Radius.circular(20.r)),
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              RouteNames.symptomsDetailScreen,
                                              arguments: symptoms[index]);
                                        },
                                      )
                                    : index != symptoms.length - 1
                                        ? SymptomsButton(
                                            text: symptoms[index],
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  RouteNames
                                                      .symptomsDetailScreen,
                                                  arguments: symptoms[index]);
                                            },
                                          )
                                        : SymptomsButton(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.r),
                                                bottomRight:
                                                    Radius.circular(20.r)),
                                            text: symptoms[index],
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  RouteNames
                                                      .symptomsDetailScreen,
                                                  arguments: symptoms[index]);
                                            },
                                          ),
                              )
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> symptoms = [
  'Abdominal cramps',
  'Acne',
  'Appetite changes',
  'Body and muscle ache',
  'Bloating',
  'Breast pain',
  'Chest tightness or pain',
  'Chills',
  'Coughing',
  'Dizziness',
  'Dry skin',
  'Fatigue',
  'Fever',
  'Headache',
  'Lower back pain',
  'Mood changes',
  'Nausea',
  'Skipped heartbeats',
  'Vomiting',
  'Wheezing',
];
