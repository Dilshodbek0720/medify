import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/cubits/location/location_cubit.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_input.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  List addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        title: "Enter your location",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              GlobalTextField(
                hintText: "Address",
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                controller: state.textController,
                onChanged: (address) {
                  context.read<LocationCubit>().getAddressByName(address: address);
                  setState(() {
                    addresses = context.read<LocationCubit>().state.addresses;
                  });
                  },
                // focusNode: state.passwordFocusNode,
                // obscureText: state.isObscure,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SvgPicture.asset(
                    AppIcons.search,
                    colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                  ),
                ),),
              8.ph,
              ListTile(
                onTap: () {},
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                leading: SvgPicture.asset(AppIcons.navigationBold),
                title: Text('Use my current location',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: AppColors.c_900,
                      fontFamily: "Urbanist"
                  ),),
              ),
              8.ph,
              const Divider(color: AppColors.c_200, thickness: 2,),
              8.ph,
              Text("Search Result",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    color: AppColors.c_700,
                    fontFamily: "Urbanist"
                ),),
              8.ph,
              // ListTile(
              //   onTap: () {},
              //   contentPadding: EdgeInsets.zero,
              //   title: Row(
              //     children: [
              //       SvgPicture.asset(AppIcons.navigationBold,
              //         width: 20,),
              //       Text("Golden Avenue",
              //         style: TextStyle(
              //             fontWeight: FontWeight.w500,
              //             fontSize: 18.sp,
              //             color: AppColors.c_900,
              //             fontFamily: "Urbanist"
              //         ),
              //       ),
              //     ],
              //   ),
              //   subtitle: Text("8502 Preston Rd. Ingl..",
              //     style: TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 17.sp,
              //         color: AppColors.c_500,
              //         fontFamily: "Urbanist"
              //     ),),
              // ),
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.zero,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppIcons.navigationBold,
                            width: 24,),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text(addresses.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: AppColors.c_900,
                        fontFamily: "Urbanist"
                    ),
                  ),
                ),
                // subtitle: Text("8502 Preston Rd. Ingl..",
                //   style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 17.sp,
                //       color: AppColors.c_500,
                //       fontFamily: "Urbanist"
                //   ),),
              ),
            ],
          );
        },
      ),
    );
  }
}
