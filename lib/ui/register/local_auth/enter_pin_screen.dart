import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/register/local_auth/widgets/local_auth_pinput.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/error_message_dialog.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key, this.isFromSecurity});

  final bool? isFromSecurity;

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  final TextEditingController codeController = TextEditingController();
  // final LocalAuthentication auth = LocalAuthentication();
  final TextEditingController pinController = TextEditingController();

  bool authenticated = false;

  @override
  void initState() {
    // _checkBiometric();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar:  AppBar(
        backgroundColor: Colors.white,
          title: const Text('Create new pin',style: TextStyle(color: AppColors.c_900),)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ListView(
                children: [
                  Text("Add a PIN number to make your account more secure",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 20.sp,
                        ),
                  ),
                  70.ph,
                  LocalAuthPinput(
                    pinPutController: pinController,
                    onCompleted: validatePin,
                  ),
                ],
              ),
            ),

            GlobalButton(
              title: 'Continue',
              radius: 100,
              textColor: AppColors.white,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.fingerPrintScreen);
              }, color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  void validatePin(String pin) {
    if(StorageRepository.getString(StorageKeys.pinCode)!=""){
      if (pin == StorageRepository.getString(StorageKeys.pinCode)) {
        // Navigator.pushReplacementNamed(context, RouteNames.tabBox);
      } else {
        showErrorMessage(
          message: 'error_pin_code',
          context: context,
        );
        pinController.text = "";
      }
    }else{
      StorageRepository.putString(StorageKeys.pinCode, pin);
    }
  }
}
