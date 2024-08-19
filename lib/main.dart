import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:boost_test/app/app_perefernces.dart';
import 'package:boost_test/app/dependency_injection.dart';
import 'package:boost_test/view/app_bloc/bloc/app_bloc.dart';
import 'package:boost_test/view/home/bloc/products_bloc.dart';
import 'package:boost_test/view/recources/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is properly initialized
  await initAppModule();


  // Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  // await initAppModule();
  EasyLocalization.logger.enableBuildModes = [];

  runApp(
  MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    ScreenUtil.init(context, designSize: const Size(390, 844));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()..add(CheckLoggedInEvent()),),
        BlocProvider(create: (context) => ProductsBloc()..add(GetProductsEvent()),),
 
      ],
      child:
     MaterialApp.router(
        title: 'Boost',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
  fontFamily: 'Montserrat',
),
     )
      

      
    );
  }
}
