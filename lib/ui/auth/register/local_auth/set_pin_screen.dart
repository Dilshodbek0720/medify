import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/auth/register/local_auth/widgets/local_auth_pinput.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/error_message_dialog.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key, this.previousPin});

  final String? previousPin;

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  String currentPin = '';
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.previousPin == null
            ? 'pin_code_installation'
                :'confirm_pin_code'),
      ),
      body: ListView(
        padding: EdgeInsets.all(width / 16),
        children: [
          (height / 8).ph,
          Text(
            widget.previousPin == null
                ? 'create_new_password'
                : 'confirm_new_password',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 20.sp),
          ),
          (height / 8).ph,
          LocalAuthPinput(
            pinPutController: pinController,
            onCompleted: _onPinSubmit,
          ),
          (height / 20).ph,
          GlobalButton(
            color: AppColors.primary,
            title: 'continue',
            radius: 100,
            textColor: AppColors.white,
            onTap: () {
              _onPinSubmit(pinController.text);
            },
          ),
        ],
      ),
    );
  }

  void _onPinSubmit(String pin) {
    if ((widget.previousPin == null) && (pin.length == 4)) {
      Navigator.pop(context);
      // Navigator.pushNamed(
      //   context,
      //   RouteNames.setPinCodeScreen,
      //   arguments: pin,
      // );
    } else {
      if (pin != widget.previousPin) {
        showErrorMessage(message: 'forgot.wrong', context: context);
      } else {
        if (pin.length == 4) {
          // StorageRepository.putString(
          //   StorageKeys.pinCode,
          //   pin,
          // );
          // Navigator.pushReplacementNamed(context, RouteNames.setBiometrics);
        } else {
          showErrorMessage(
            message: 'set_pin_code.pin_is_empty',
            context: context,
          );
        }
      }
    }
    pinController.text = '';
  }
}
