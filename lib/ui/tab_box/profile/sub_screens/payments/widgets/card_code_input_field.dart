import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/auth_cubit/auth_cubit.dart';
import 'package:medify/cubits/card_code_input/card_code_input_cubit.dart';
import 'package:medify/cubits/code_input/code_input_cubit.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/credit_card/credit_card.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/models/user/user_model.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/forgot_password/widgets/success_dialog.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class CardCodeInputField extends StatefulWidget {
  const CardCodeInputField({super.key, required this.text});
  final String text;

  @override
  CardCodeInputFieldState createState() => CardCodeInputFieldState();
}

class CardCodeInputFieldState extends State<CardCodeInputField> {
  late CardCodeInputCubit codeInputCubit;

  @override
  void initState() {
    super.initState();
    codeInputCubit = CardCodeInputCubit();
    codeInputCubit
      ..setContext(context)
      ..startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Code has been send to ${widget.text}",
          style: TextStyle(
            color: AppColors.c_900,
            fontFamily: "Urbanist",
            fontSize: 18.sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
        60.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            return SizedBox(
              width: 50.0.w,
              child: TextField(
                style: TextStyle(
                  fontFamily: "Urbanist",
                  fontSize: 24.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
                onTap: () {
                  setState(() {
                    FocusScope.of(context).requestFocus(codeInputCubit.pinFocusNodes[index]);
                  });
                },
                controller: codeInputCubit.pinControllers[index],
                maxLength: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only numeric input
                ],
                cursorColor: AppColors.primary.withOpacity(0.6),
                decoration: InputDecoration(
                    counterText: "",
                    // contentPadding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 32.0.w),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary,width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.c_200),
                    ),
                    filled: true,
                    fillColor: codeInputCubit.pinFocusNodes[index].hasFocus
                        ? AppColors.primary.withOpacity(0.08)
                        : AppColors.c_50
                ),
                textAlign: TextAlign.center,
                focusNode: codeInputCubit.pinFocusNodes[index],
                onChanged: (value) async{
                  setState(() {
                    codeInputCubit.handleCodeInput(index, value);
                  });
                  if(codeInputCubit.pinControllers[0].text.isNotEmpty && codeInputCubit.pinControllers[1].text.isNotEmpty && codeInputCubit.pinControllers[2].text.isNotEmpty && codeInputCubit.pinControllers[3].text.isNotEmpty && codeInputCubit.pinControllers[4].text.isNotEmpty && codeInputCubit.pinControllers[5].text.isNotEmpty){
                    UniversalData data = await context.read<AuthCubit>().verifyCreditCard(context: context, verificationToken: int.parse(codeInputCubit.pinControllers[0].text+codeInputCubit.pinControllers[1].text+codeInputCubit.pinControllers[2].text+codeInputCubit.pinControllers[3].text+codeInputCubit.pinControllers[4].text+codeInputCubit.pinControllers[5].text), token: StorageRepository.getString(
                        StorageKeys.userToken
                    ));
                    if(data.error.isEmpty){
                      UserModel userModel = data.data;
                      CreditCardModel creditCardModel = userModel.creditCards.last;
                      if(creditCardModel.cardVerified && context.mounted){
                        context.read<SignUpCubit>().clearTextFields();
                        successDialog(
                            image: AppIcons.successReg,
                            title: "Congratulations",
                            text: "Your credit card is ready to use. You will be redirected to the Home page in a few seconds..", context: context);
                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.pushNamed(context, RouteNames.tabBox);
                      }
                    }
                  }
                },
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    codeInputCubit.disposeControllersAndFocusNodes();
    super.dispose();
  }
}