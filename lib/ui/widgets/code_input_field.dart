import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/auth_cubit/auth_cubit.dart';
import 'package:medify/cubits/code_input/code_input_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/tab_box.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key, required this.verificationCode});
  final int verificationCode;

  @override
  CodeInputFieldState createState() => CodeInputFieldState();
}

class CodeInputFieldState extends State<CodeInputField> {
  late CodeInputCubit codeInputCubit;
  int code = 0;
  @override
  void initState() {
    super.initState();
    code = widget.verificationCode;
    codeInputCubit = CodeInputCubit();
    codeInputCubit
      ..setContext(context)
      ..startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Code has been send to +1 111 ******99",
          style: TextStyle(
            color: AppColors.c_900,
            fontFamily: "Urbanist",
            fontSize: 18.sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
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
                onChanged: (value) {
                  setState(() {
                    codeInputCubit.handleCodeInput(index, value);
                    if(codeInputCubit.pinControllers[0].text.isNotEmpty && codeInputCubit.pinControllers[1].text.isNotEmpty && codeInputCubit.pinControllers[2].text.isNotEmpty && codeInputCubit.pinControllers[3].text.isNotEmpty && codeInputCubit.pinControllers[4].text.isNotEmpty && codeInputCubit.pinControllers[5].text.isNotEmpty){
                      print(code);
                      if(int.parse(codeInputCubit.pinControllers[0].text+codeInputCubit.pinControllers[1].text+codeInputCubit.pinControllers[2].text+codeInputCubit.pinControllers[3].text+codeInputCubit.pinControllers[4].text+codeInputCubit.pinControllers[5].text) == code){
                        Navigator.pushNamed(context, RouteNames.tabBox);
                      }
                    }
                  });
                },
              ),
            );
          }),
        ),
        60.ph,
        BlocBuilder<CodeInputCubit, CodeInputState>(
          builder: (context, state) {
            // final defaultTextStyle = Theme.of(context).textTheme.titleMedium;

            if (state is CodeInputCountdown) {
              final remainingTime = "${state.remainingTime}";
              return state.remainingTime!=0?RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resend code in ",
                      style: TextStyle(
                        color: AppColors.c_900,
                        fontFamily: "Urbanist",
                        fontSize: 18.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                    TextSpan(
                      text: remainingTime,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontFamily: "Urbanist",
                        fontSize: 18.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                    TextSpan(
                      text: " s",
                      style: TextStyle(
                        color: AppColors.c_900,
                        fontFamily: "Urbanist",
                        fontSize: 18.sp,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ): TextButton(
                onPressed: (){
                  context.read<CodeInputCubit>().resendCode();
                },
                child: Text("Resend code",
                  style: TextStyle(
                    color: AppColors.c_900,
                    fontFamily: "Urbanist",
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),),
              );
            } else {
              return const Text(
                "",
                // style: defaultTextStyle,
              );
            }
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    codeInputCubit.disposeControllersAndFocusNodes();
    super.dispose();
  }
}