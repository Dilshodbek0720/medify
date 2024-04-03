import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/blocs/email_message_file/email_message_file_bloc.dart';
import 'package:medify/blocs/messages/message_bloc.dart';
import 'package:medify/blocs/payment_add_bloc/payment_add_bloc.dart';
import 'package:medify/blocs/payment_bloc/payment_bloc.dart';
import 'package:medify/cubits/auth_cubit/auth_cubit.dart';
import 'package:medify/cubits/booking_info_detail/booking_info_detail_cubit.dart';
import 'package:medify/cubits/calendar_doctors/calendar_doctors_cubit.dart';
import 'package:medify/cubits/calendar_hospitals/calendar_hospitals_cubit.dart';
import 'package:medify/cubits/calendar_todo/calendar_todo_cubit.dart';
import 'package:medify/cubits/code_input/code_input_cubit.dart';
import 'package:medify/cubits/edit_profile/edit_profile_cubit.dart';
import 'package:medify/cubits/get_location/get_location_cubit.dart';
import 'package:medify/cubits/help_center/help_center_category_cubit.dart';
import 'package:medify/cubits/location/location_cubit.dart';
import 'package:medify/cubits/notifications/notification_cubit.dart';
import 'package:medify/cubits/register/register_cubit.dart';
import 'package:medify/cubits/security_cubit/security_cubit.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/cubits/tab/tab_cubit.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/network/api_service.dart';
import 'package:medify/data/repository/auth_repository.dart';
import 'package:medify/data/repository/payment_repository.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/screen_size.dart';

import 'blocs/todos/todo_message_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
      MainApp(apiService: ApiService(),)
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.apiService});
  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository(apiService: apiService)),
        RepositoryProvider(create: (context) => PaymentRepository(apiService: apiService)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabCubit()),
          BlocProvider(create: (context) => AuthCubit(context.read<AuthRepository>())),
          BlocProvider(create: (context) => HelpCenterCategoryCubit()),
          BlocProvider(create: (context) => CodeInputCubit()),
          BlocProvider(create: (context) => SignUpCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => PaymentBloc(context.read<PaymentRepository>())),
          BlocProvider(create: (context) => PaymentAddBloc()),
          BlocProvider(create: (context) => MessageBloc()),
          BlocProvider(create: (context) => TodoMessageBloc()),
          BlocProvider(create: (context) => EmailMessageFileBloc()),
          BlocProvider(create: (context) => GetLocationCubit()),
          BlocProvider(create: (context) => NotificationCubit()),
          BlocProvider(create: (context) => SecurityCubit()),
          BlocProvider(create: (context) => EditProfileCubit()),
          BlocProvider(create: (context) => BookingInfoDetailCubit()),
          BlocProvider(create: (context) => CalendarDoctorsCubit()),
          BlocProvider(create: (context) => CalendarHospitalsCubit()),
          BlocProvider(create: (context) => CalendarTodoCubit()),
          BlocProvider(create: (context) => LocationCubit(apiService: ApiService())),
        ],
        child: EasyLocalization(
            supportedLocales: const [
              Locale('ru', 'RU'),
              Locale('uz', 'UZ'),
              Locale('uz', 'Cyrl'),
              Locale('en', 'US'),
            ],
            path: 'assets/translations',
            fallbackLocale: const Locale('uz', 'UZ'),
            child: const MyApp()),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(figmaWidth, figmaHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: "Urbanist",
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: false,
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  iconTheme: IconThemeData(color: AppColors.c_900))),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
