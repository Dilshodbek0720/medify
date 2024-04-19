import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medify/cubits/auth_cubit/auth_cubit.dart';
import 'package:medify/cubits/location/location_cubit.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/data/models/location/location_model.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import 'package:medify/data/servise.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {

   late LocationCubit locationProvider;
   UniversalData? universalData;

  // call() async {
  //   await initLocationService(context);
  // }
  @override
  void initState() {
    locationProvider = BlocProvider.of<LocationCubit>(context, listen: false);
    // call();
    debugPrint("print");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlobalAppBar(
        title: "Your location",
        onTap: (){
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.blueTransparent
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: SvgPicture.asset(AppIcons.getSvg(name: AppIcons.location,iconType: IconType.bold),width: 50,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn)),
                  ))),
            50.ph,
            Text("What is your location?",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                  color: AppColors.c_900,
                  fontFamily: "Urbanist"
              ),),
            100.ph,
            GlobalButton(color: AppColors.primary, textColor: AppColors.white, title: "Allow location access", onTap: ()async{
              // call();
              LatLng? latLng = await initLocationService(context);
              if(latLng!=null && context.mounted){
                UniversalData data = await context.read<AuthCubit>().updateLocation(context: context, userLocationModel: UserLocationModel(locationModel: LocationModel(pointModel: PointModel(
                  lat: 0,
                  lng: 0,
                ))), token: StorageRepository.getString(StorageKeys.userToken));
                UserModel user = data.data;
                print(user.phoneNumber);
              }
              if(context.mounted){
                Navigator.pushNamed(context, RouteNames.successful,  arguments: "location");
              }
            }),
            20.ph,
            TextButton(onPressed: (){
              Navigator.pushNamed(context, RouteNames.searchLocationScreen);
            }, child: Text("Enter Location Manually",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.primary,
                fontFamily: "Urbanist"
            ),))
          ],
        ),
      ),
    );
  }
}
