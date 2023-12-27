import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medify/ui/widgets/global_button.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/ui_utils/error_message_dialog.dart';

class SetBiometricsScreen extends StatefulWidget {
  const SetBiometricsScreen({super.key});

  @override
  State<SetBiometricsScreen> createState() => _SetBiometricsScreenState();
}

class _SetBiometricsScreenState extends State<SetBiometricsScreen> {
  bool isAuth = false;
  final LocalAuthentication auth = LocalAuthentication();

  void _checkBiometric() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Поместите палец на сканер отпечатков пальцев, чтобы начать",
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
      debugPrint("AUTHENTICATED START:$authenticated");
    } catch (e) {
      debugPrint("error using biometric auth: $e");
      if (context.mounted) {
        showErrorMessage(
            message: 'Error scanner fingerprint', context: context);
      }
    }
    setState(() {
      isAuth = authenticated;
      // StorageRepository.putBool("isAuth", isAuth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: const Text('Set Your Fingerprint',
          style: TextStyle(
              color: AppColors.c_900,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              fontFamily: "Urbanist"),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
                "Add a fingerprint to make your account more secure.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: AppColors.c_900,
              fontFamily: "Urbanist"
            ),
            textAlign: TextAlign.center,),
            SvgPicture.asset(AppIcons.fingerPrintSvg),
            const Text(
             'Please put your finger on the fingerprint scanner to get started.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.c_900,
                  fontFamily: "Urbanist"
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: GlobalButton(
                  title: 'skip',
                  onTap: () {
                    // Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                  },
                  radius: 100,
                  color: AppColors.c_50, textColor: AppColors.c_900,
                )),
                SizedBox(width: 12.w),
                Expanded(
                  child: GlobalButton(
                    title: 'next',
                    onTap: () {
                      _checkBiometric();
                      // if (StorageRepository.getBool("isAuth")) {
                      //   Navigator.pushReplacementNamed(context, RouteNames.tabBox);
                      // }
                    },
                    radius: 100, color: AppColors.primary, textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
