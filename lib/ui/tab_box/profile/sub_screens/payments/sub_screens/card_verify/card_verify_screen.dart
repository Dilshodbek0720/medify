import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medify/cubits/code_input/code_input_cubit.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/payments/widgets/card_code_input_field.dart';
import 'package:medify/ui/widgets/code_input_field.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/size/size_extension.dart';

class CardVerifyScreen extends StatefulWidget {
  const CardVerifyScreen({super.key});

  @override
  State<CardVerifyScreen> createState() => _CardVerifyScreenState();
}

class _CardVerifyScreenState extends State<CardVerifyScreen> {
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
          const CardCodeInputField(text: "sayitqulovdilshodbek@gmail.com",),
          const Spacer(),
          48.ph,
        ],
      ),
    );
  }
}
