import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/code_input/code_input_cubit.dart';
import 'package:medify/ui/widgets/code_input_field.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  void initState() {
    context.read<CodeInputCubit>().setContext(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: "OTP Code Verification",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          20.ph,
          const Spacer(),
          const CodeInputField(),
          const Spacer(),
          // Row(
          //   children: [
          //     Expanded(
          //       child: GlobalButton(
          //         title: "Back",
          //         onTap: widget.onTapLeft,
          //         radius: 100.r,
          //         color: AppColors.cA6A9AB,
          //         textColor: Colors.black,
          //       ),
          //     ),
          //     20.pw,
          //     Expanded(
          //       child: GlobalButton(
          //         title: "Next",
          //         onTap: widget.onTapRight,
          //         radius: 100.r,
          //         color: AppColors.primary,
          //         textColor: Colors.white,
          //       ),
          //     ),
          //   ],
          // ),
          48.ph,
        ],
      ),
    );
  }
}
