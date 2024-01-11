import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:medify/blocs/payment_add_bloc/payment_add_bloc.dart';
import 'package:medify/blocs/payment_bloc/payment_bloc.dart';
import 'package:medify/data/models/payment/payment_model.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/forgot_password/widgets/success_dialog.dart';
import 'package:medify/ui/payments/widgets/payment_text_field.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class PaymentAddCardScreen extends StatelessWidget {
  const PaymentAddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "Add New Card",
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    children: [
                      BlocBuilder<PaymentBloc, PaymentState>(
                        builder: (context, state) {
                          return Container(
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
                                      state.cardName.isEmpty
                                          ? Text(
                                        'Card Name',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            fontFamily: "Urbanist"
                                        ),
                                      )
                                          : Text(
                                        state.cardName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            fontFamily: "Urbanist"
                                        ),
                                      ),
                                      Text(
                                        state.cardNumber.startsWith('8600')
                                            ? "UzCard"
                                            : state.cardNumber.startsWith('9860')
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
                                  state.cardNumber.isEmpty
                                      ? Text(
                                    "•••• •••• •••• ••••",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 48.sp,
                                        fontFamily: "Urbanist"
                                    ),
                                  )
                                      : Text(
                                    state.cardNumber,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30.sp,
                                        fontFamily: "Urbanist"
                                    ),
                                  ),
                                  36.ph,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Card Holder Name',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10.sp,
                                                fontFamily: "Urbanist"
                                            ),
                                          ),
                                          4.ph,
                                          SizedBox(
                                            width: 100.w,
                                            child: Text(
                                              "•••• ••••",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  fontFamily: "Urbanist"
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
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
                                          state.expireDate.isEmpty
                                              ? Text(
                                            "••••/••••",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                fontFamily: "Urbanist"
                                            ),
                                          )
                                              : Text(
                                            state.expireDate,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                fontFamily: "Urbanist"
                                            ),
                                          ),
                                        ],
                                      ),
                                      state.cardNumber.startsWith("8600")
                                          ? SizedBox(
                                          width: 55.w, height: 55.h,
                                            child: Image.asset(AppIcons.uzCardPng,),
                                          )
                                          : state.cardNumber.startsWith("9860")
                                          ? SizedBox(
                                          width: 55.w, height: 55.h,
                                          child: Image.asset(AppIcons.humoPng))
                                          : const Icon(Icons.add_card, color: AppColors.white,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      24.ph,
                      PaymentTextField(
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          maskFormatter: MaskTextInputFormatter(
                            mask: '################',
                            filter: {"#": RegExp(r'[a-zA-z]')},
                          ),
                          text: 'Card Name',
                          hintText: 'Card Name',
                          onChanged: (value) {
                            context.read<PaymentBloc>().add(CardName(cardName: value));
                          }),
                      24.ph,
                      PaymentTextField(
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        maskFormatter: MaskTextInputFormatter(
                          mask: '#### #### #### ####',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),
                        text: 'Card Number',
                        hintText: "1234 5678 1234 5678",
                        onChanged: (value) {
                          context.read<PaymentBloc>().add(CardNumber(cardNumber: value));
                        },
                      ),
                      24.ph,
                      PaymentTextField(
                        textInputType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        maskFormatter: MaskTextInputFormatter(
                          mask: "##/##",
                          filter: {"#": RegExp(r'[0-9]')},
                        ),
                        text: 'Expiry Date',
                        hintText: "01/01",
                        onChanged: (value) {
                          context.read<PaymentBloc>().add(ExpireDate(expireDate: value));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GlobalButton(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            onTap: () async{
              context.read<PaymentAddBloc>().add(AddCards(
                  name: PaymentModel(
                      title: context.read<PaymentBloc>().state.cardName,
                      paymentIcon: AppIcons.masterCard,
                      price: 100)));
              successDialog(
                  image: AppIcons.successReg,
                  title: "Congratulations",
                  text: "Your account is ready to use. You will be redirected to the Home page in a few seconds..", context: context);
              await Future.delayed(const Duration(seconds: 3));
              if(context.mounted) {
                Navigator.pushReplacementNamed(context, RouteNames.tabBox);
              }
            },
            title: 'Add New Card',
            radius: 100,
            color: AppColors.primary,
            textColor: AppColors.white,
          ),
          48.ph
        ],
      ),
    );
  }
}