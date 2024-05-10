import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:medify/blocs/favorite/favorite_bloc.dart';
import 'package:medify/ui/search/widgets/doctor_card.dart';
import 'package:medify/ui/tab_box/home/widgets/hospital_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({super.key});

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {

  @override
  void initState() {
    context.read<FavoriteBloc>().add(GetFavorite());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_50,
      appBar: GlobalAppBar(
        background: AppColors.c_50,
        onTap: (){
          Navigator.pop(context);
        },
        title: "My Favorites",
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state){
      return false ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.6,
              height: MediaQuery.of(context).size.width*0.6,
              child: Lottie.asset(AppIcons.emptyLottie),
            ),
            Text(state.message, textAlign: TextAlign.center,),
            80.ph,
          ],
        ),
      ) : ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
            child: Text(
              "Favorite Doctors",
              style:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...List.generate(3, (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
            child: DoctorsCard(
              length: 10,
              index: index,
              name: "Ahmadjanova Nasibaxon Erkinovna",
              category: "Ginekolog",
              experience: "Tajriba: 29 yil",
              language: "uz | ru",
              rating: "4.4",),
          ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
            child: Text(
              "Favorite Hospitals",
              style:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...List.generate(2, (index) => Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
            child: const HospitalCard(),
          ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
            child: Text(
              "Favorite Services",
              style:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...List.generate(2, (index) => Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
            child: const HospitalCard(),
          ),)
        ],
      ); })
    );
  }
}
