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
          children: [
            ...List.generate(4, (index) => DoctorsCard(
                length: 10,
                index: index,
                name: "Ahmadjanova Nasibaxon Erkinovna",
                category: "Ginekolog",
                experience: "Tajriba: 29 yil",
                price: "1 daqiqa - 5000 so'm",
                language: "uz | ru",
                rating: "4.4",),)
          ],
        ),
      ),
    );
  }
}
