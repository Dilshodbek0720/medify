import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class CardDetailScreen extends StatefulWidget {
  const CardDetailScreen({super.key});

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  String cardNumber = '8600289424892482';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: 'Card Detail',
        action: [
          TextButton(onPressed: (){
            print(StorageRepository.getString(StorageKeys.userToken));
          }, child: const Text("O'chirish"),),
          8.pw,
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.primary,
            ),
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Card Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            fontFamily: "Urbanist"
                        ),
                      ),
                      Text(
                        cardNumber.startsWith('8600')
                            ? "UzCard"
                            : cardNumber.startsWith('9860')
                            ? "Humo"
                            : 'Card Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            fontFamily: "Urbanist"
                        ),
                      ),
                    ],
                  ),
                  36.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "61 937",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            fontFamily: "Urbanist"
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.h, left: 4.w),
                        child: Text(
                          "so'm",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              fontFamily: "Urbanist"
                          ),
                        ),
                      ),
                    ],
                  ),
                  18.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${cardNumber.substring(0,6)}** **** ${cardNumber.substring(12)}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            fontFamily: "Urbanist"
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry Date',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                fontFamily: "Urbanist"
                            ),
                          ),
                          4.ph,
                          Text(
                            "12/32",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                fontFamily: "Urbanist"
                            ),
                          ),
                        ],
                      ),
                      cardNumber.startsWith("8600")
                          ? SizedBox(
                        width: 55.w, height: 55.h,
                        child: Image.asset(AppIcons.uzCardPng,),
                      )
                          : cardNumber.startsWith("9860")
                          ? SizedBox(
                          width: 55.w, height: 55.h,
                          child: Image.asset(AppIcons.humoPng))
                          : const Icon(Icons.add_card, color: AppColors.white,),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
