import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/blocs/payment_add_bloc/payment_add_bloc.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/payments/widgets/payment_container.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class PaymentBookingsScreen extends StatefulWidget {
  const PaymentBookingsScreen({super.key});

  @override
  State<PaymentBookingsScreen> createState() => _PaymentBookingsScreenState();
}

class _PaymentBookingsScreenState extends State<PaymentBookingsScreen> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              AppIcons.arrowLeft,
              colorFilter:
                  const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          ),
          title: Text("Payment",
              style: TextStyle(
                color: AppColors.c_900,
                fontSize: 24.sp,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.moreCircle,
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        body: BlocBuilder<PaymentAddBloc, PaymentAddState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      12.ph,
                      ...List.generate(
                          state.cards.length,
                          (index) => PaymentContainer(
                              cardNumber: "8600 8654 4574 5789",
                              title: state.cards[index].title,
                              onTap: () {
                                selected = index;
                                setState(() {});
                              },
                              isSelect: selected == index,
                              state: 'Connected')),
                      12.ph,
                      GlobalButton(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        onTap: () {
                          Navigator.pushNamed(
                              context, RouteNames.paymentAddCard);
                        },
                        title: "Add New Card",
                        radius: 100,
                        color: AppColors.primary100,
                        textColor: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                GlobalButton(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.reviewSummaryScreen);
                  },
                  title: tr("continue"),
                  radius: 100,
                  color: AppColors.primary,
                  textColor: AppColors.white,
                ),
                40.ph
              ],
            );
          },
        ));
  }
}
