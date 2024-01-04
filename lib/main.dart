import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/blocs/payment_add_bloc/payment_add_bloc.dart';
import 'package:medify/blocs/payment_bloc/payment_bloc.dart';
import 'package:medify/cubits/code_input_cubit.dart';
import 'package:medify/cubits/register/register_cubit.dart';
import 'package:medify/cubits/sign_cubit/sign_cubit.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/screen_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CodeInputCubit()),
      BlocProvider(create: (context) => SignUpCubit()),
      BlocProvider(create: (context) => RegisterCubit()),
      BlocProvider(create: (context) => PaymentBloc()),
      BlocProvider(create: (context) => PaymentAddBloc()),
    ],
    child: const MyApp(),
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
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false,appBarTheme: const AppBarTheme(elevation: 0,iconTheme: IconThemeData(color: AppColors.c_900))),
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
