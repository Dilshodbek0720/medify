import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/appointment/sub_screens/chek_screen/widgets/chek_item.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class ChekScreen extends StatefulWidget {
  const ChekScreen({super.key});

  @override
  State<ChekScreen> createState() => _ChekScreenState();
}

class _ChekScreenState extends State<ChekScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Chek",
        centerTitle: true,
        onTap: (){
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            12.ph,
            Row(children: [
              Container(
                width: 100*825/height,
                height: 60*375/width,
                color: AppColors.blueTransparent,
                child: Image.asset(AppIcons.uzCardPng, fit: BoxFit.cover,),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.r)
                ),
                child: const Text("Dilshodbek"),
              )
            ],),
            16.ph,
            const ChekItem(title: "F.I.O", description: "Zokirjonov Sunnatilla Zoirjon o'g'li"),
            const ChekItem(title: "Number phone", description: "+998949860899"),
            const ChekItem(title: "Oplata", description: "GeekBrains"),
            const ChekItem(title: "I.N.N", description: "784828473"),
            const ChekItem(title: "Summa", description: "0.00 so'm"),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Text("Karta", style: TextStyle(
                      color: AppColors.c_900,
                      fontSize: 16.sp
                  ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("8600 06** **** 2459", style: TextStyle(
                              color: AppColors.c_900,
                              fontSize: 16.sp
                          ),
                          ),
                          SizedBox(
                            width: 30.w,
                              height: 20.h,
                            child: Image.asset(AppIcons.uzCardPng, fit: BoxFit.cover,),
                          )
                        ],
                      ),
                      Text("KASIMOVA MANZURA ABIDOVNA", style: TextStyle(
                          color: AppColors.c_900,
                          fontSize: 16.sp
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            12.ph,
            const ChekItem(title: "Summa", description: "550 000.00 so'm"),
            const ChekItem(title: "Paid", description: "07.06.2024 18:26"),
          ],
        ),
      ),
    );
  }
}
