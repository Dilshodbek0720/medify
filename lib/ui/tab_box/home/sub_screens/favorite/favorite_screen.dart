import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        onTap: (){
          Navigator.pop(context);
        },
        title: "My Favorite Doctor",
        action: [
          getIcon(AppIcons.search, context: context, onTap: (){ }),
          getIcon(AppIcons.moreCircle, context: context, onTap: (){ }),
          10.pw,
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: const [
            DoctorsCard(
              index: 0,
              name: 'Dr. Jenny Watson',
              category: 'Immunologists',
              hospital: 'Christ Hospital',
              rating: '4.4',
              views: '4,942',
            ),
            DoctorsCard(
              index: 1,
              name: 'Dr. Jenny Baranick',
              category: 'Allergists',
              hospital: 'JFK Medical Center',
              rating: '4.6',
              views: '3,837',
            ),
            DoctorsCard(
              index: 2,
              name: 'Dr. Jenny Zirkind',
              category: 'Neurologists',
              hospital: 'Franklin Hospital',
              rating: '4.8',
              views: '6,362',
            ),
            DoctorsCard(
              index: 3,
              name: 'Dr. Jenny Wigham',
              category: 'Cardiologists',
              hospital: 'The Valley Hospital',
              rating: '4.8',
              views: '4,729',
            ),
          ],
        ),
      ),
    );
  }
}
