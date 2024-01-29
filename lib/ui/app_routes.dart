import 'package:flutter/material.dart';
import 'package:medify/ui/auth/lets_in_screen.dart';
import 'package:medify/ui/auth/sign_in_screen.dart';
import 'package:medify/ui/auth/sign_up_screen.dart';
import 'package:medify/ui/booking/booking_info_detail.dart';
import 'package:medify/ui/booking/calendar_screen.dart';
import 'package:medify/ui/booking/our_rec.dart';
import 'package:medify/ui/booking/payment_bookings_screen.dart';
import 'package:medify/ui/booking/review_summary.dart';
import 'package:medify/ui/category/category_screen.dart';
import 'package:medify/ui/enterence/onboarding/onboarding_pages.dart';
import 'package:medify/ui/enterence/welcome/welcome_screen.dart';
import 'package:medify/ui/forgot_password/confirm_code/confirm_code_screen.dart';
import 'package:medify/ui/forgot_password/create_password/create_password_screen.dart';
import 'package:medify/ui/forgot_password/forgot_password_screen.dart';
import 'package:medify/ui/location/get_location.dart';
import 'package:medify/ui/location/search_location.dart';
import 'package:medify/ui/payments/payment_add_card/payment_add_card_screen.dart';
import 'package:medify/ui/register/local_auth/enter_pin_screen.dart';
import 'package:medify/ui/register/local_auth/set_biometrics_screen.dart';
import 'package:medify/ui/register/register_screen.dart';
import 'package:medify/ui/register/verify/verify_screen.dart';
import 'package:medify/ui/register/verify/verify_with.dart';
import 'package:medify/ui/review_screen/review_screen.dart';
import 'package:medify/ui/search/search_screen.dart';
import 'package:medify/ui/splash/splash.dart';
import 'package:medify/ui/tab_box/home/sub_screens/doctor_booking/doctor_detail/doctor_detail_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/favorite/favorite_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/hospital_detail_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/sub_screens/gallery_detail/gallery_detail_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/sub_screens/gallery_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/notification/notification_screen.dart';
import 'package:medify/ui/tab_box/mailing/sub_screens/mail_detail/mail_detail_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/top_doctors/top_doctors_screen.dart';
import 'package:medify/ui/tab_box/home/sub_screens/top_hospitals/top_hospitals_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/edit_profile/edit_profile_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/language/language_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/notification/control_notification_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/payments/payment_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/security/security_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/storage_activity/storage_activity_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/storage_detail/storage_detail_screen.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/storage_home/storage_home_screen.dart';
import 'package:medify/ui/tab_box/tab_box.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String onBoardingPages = "/onboarding_pages";
  static const String welcomeScreen = "/welcome";
  static const String signInScreen = "/sign_in_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String letsInScreen = "/lets_in_screen";
  static const String forgotPassword = "/forgot_password";
  static const String confirmCodeScreen = "/confirm_code_screen";
  static const String createPassword = "/create_password";
  static const String fillYourProfile = "/fill_your_profile";
  static const String enterPinScreen = "/enter_pin_screen";
  static const String fingerPrintScreen = "/finger_print_screen";
  static const String paymentAddCard = "/payment_add_card";
  static const String tabBox = "/tab_box";
  static const String notificationScreen = "/notification_screen";
  static const String favoriteScreen = "/favorite_screen";
  static const String searchScreen = "/search_screen";
  static const String categoryScreen = "/category_screen";
  static const String verifyWithScreen = "/verify_with_screen";
  static const String verifyScreen = "/verify_screen";
  static const String getLocationScreen = "/get_location_screen";
  static const String searchLocationScreen = "/search_location_screen";
  static const String languageScreen = "/language_screen";
  static const String controlNotification = "/control_notification";
  static const String paymentListScreen = "/payment_screen";
  static const String securityScreen = "/security_screen";
  static const String editProfileScreen = "/edit_profile_screen";
  static const String doctorDetailScreen = "/doctor_detail_screen";
  static const String reviewScreen = "/review_screen";
  static const String calendarScreen = "/calendar_screen";
  static const String ourRec = "/our_rec";
  static const String reviewSummaryScreen = "/review_summary_screen";
  static const String bookingInfoDetailScreen = "/booking_info_detail_screen";
  static const String hospitalDetailScreen = "/hospital_detail_screen";
  static const String galleryScreen = "/gallery_screen";
  static const String paymentBookingsScreen = "/payment_bookings_screen";
  static const String galleryDetailScreen = "/gallery_detail_screen";
  static const String mailDetailScreen = "/mail_detail_screen";
  static const String topDoctorsScreen = "/top_doctors_screen";
  static const String topHospitalsScreen = "/top_hospitals_screen";
  static const String storageHomeScreen = "/storage_home_screen";
  static const String storageActivityScreen = "/storage_activity_screen";
  static const String storageDetailScreen = "/storage_detail_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case RouteNames.onBoardingPages:
        return MaterialPageRoute(
          builder: (context) => const OnboardingPages(),
        );
      case RouteNames.letsInScreen:
        return MaterialPageRoute(
          builder: (context) => const LetsYouInScreen(),
        );
      case RouteNames.signInScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgotPassWord(),
        );
      case RouteNames.confirmCodeScreen:
        return MaterialPageRoute(
          builder: (context) => const ConfirmCodeScreen(),
        );
      case RouteNames.createPassword:
        return MaterialPageRoute(
          builder: (context) => const CreatePasswordScreen(),
        );
      case RouteNames.fillYourProfile:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(navigateFromAuth: true),
        );
      case RouteNames.enterPinScreen:
        return MaterialPageRoute(
          builder: (context) => const EnterPinScreen(),
        );
      case RouteNames.fingerPrintScreen:
        return MaterialPageRoute(
          builder: (context) => const SetBiometricsScreen(),
        );
      case RouteNames.paymentAddCard:
        return MaterialPageRoute(
          builder: (context) => const PaymentAddCardScreen(),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBox(),
        );
      case RouteNames.notificationScreen:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case RouteNames.favoriteScreen:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );
      case RouteNames.searchScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case RouteNames.categoryScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoryScreen(),
        );
      case RouteNames.verifyWithScreen:
        return MaterialPageRoute(
          builder: (context) => const VerifyWithScreen(),
        );
      case RouteNames.verifyScreen:
        return MaterialPageRoute(
          builder: (context) => const VerifyScreen(),
        );
      case RouteNames.getLocationScreen:
        return MaterialPageRoute(
          builder: (context) => const GetLocationScreen(),
        );
      case RouteNames.searchLocationScreen:
        return MaterialPageRoute(
          builder: (context) => const SearchLocationScreen(),
        );
      case RouteNames.languageScreen:
        return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        );
      case RouteNames.controlNotification:
        return MaterialPageRoute(
          builder: (context) => const ControlNotificationScreen(),
        );
      case RouteNames.paymentListScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentsListScreen(),
        );
      case RouteNames.securityScreen:
        return MaterialPageRoute(
          builder: (context) => const SecurityScreen(),
        );
      case RouteNames.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case RouteNames.doctorDetailScreen:
        return MaterialPageRoute(
          builder: (context) => const DoctorDetailScreen(),
        );
      case RouteNames.reviewScreen:
        return MaterialPageRoute(
          builder: (context) => const ReviewScreen(),
        );
      case RouteNames.calendarScreen:
        return MaterialPageRoute(
          builder: (context) => const CalendarScreen(),
        );
      case RouteNames.bookingInfoDetailScreen:
        return MaterialPageRoute(
          builder: (context) => const BookingInfoDetail(),
        );
      case RouteNames.ourRec:
        return MaterialPageRoute(
          builder: (context) => const OurRecommendationScreen(),
        );
      case RouteNames.reviewSummaryScreen:
        return MaterialPageRoute(
          builder: (context) => const ReviewSummaryScreen(),
        );
      case RouteNames.hospitalDetailScreen:
        return MaterialPageRoute(
          builder: (context) => const HospitalDetailScreen(),
        );
      case RouteNames.galleryScreen:
        return MaterialPageRoute(
          builder: (context) => const GalleryScreen(),
        );
      case RouteNames.paymentBookingsScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentBookingsScreen(),
        );
      case RouteNames.topDoctorsScreen:
        return MaterialPageRoute(
          builder: (context) => const TopDoctorsScreen(),
        );
      case RouteNames.topHospitalsScreen:
        return MaterialPageRoute(
          builder: (context) => const TopHospitalsScreen(),
        );
      case RouteNames.galleryDetailScreen:
        Map<Object, Object> maps = settings.arguments as Map<Object, Object>;
        return MaterialPageRoute(
          builder: (context) => GalleryDetailScreen(images: maps['images'] as List<String>, selectedIndex: maps['selectedIndex'] as int,),
        );
      case RouteNames.mailDetailScreen:
        return MaterialPageRoute(
          builder: (context) => const MailDetailScreen(),
        );
      case RouteNames.storageHomeScreen:
        return MaterialPageRoute(
          builder: (context) => const StorageHomeScreen(),
        );
      case RouteNames.storageActivityScreen:
        return MaterialPageRoute(
          builder: (context) => const StorageActivityScreen(),
        );
      case RouteNames.storageDetailScreen:
        return MaterialPageRoute(
          builder: (context) => const StorageDetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("Route not found!")),
          ),
        );
    }
  }
}
