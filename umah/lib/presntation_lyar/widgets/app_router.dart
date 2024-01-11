import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:umah/costanse/pages.dart';
import 'package:umah/presntation_lyar/screens/HomeScreen.dart';
import 'package:umah/presntation_lyar/screens/loginScreen.dart';
import 'package:umah/web_servese/dio/web_serv.dart';
import 'package:umah/web_servese/reproserty/myRepo.dart';
import '../../besnese_logic/get_method/get_method_cubit.dart';
import '../../besnese_logic/uploding_data/uploding_data_cubit.dart';

class AppRouter {
  UplodingDataCubit? uplodingDataCubit;
  GetMethodCubit? getMethodCubit;
  EmailAuthCubit? emailAuthCubit;

  AppRouter() {
    uplodingDataCubit = UplodingDataCubit(MyRepo(NameWebServise()));
    getMethodCubit = GetMethodCubit(MyRepo(NameWebServise()));
    emailAuthCubit = EmailAuthCubit(MyRepo(NameWebServise()));
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logain:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const LoginScreen(),
                ));
      //   case Optpage:
      //     final phoneNumber = settings.arguments;
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider<PhoneAuthCubit>.value(
      //               value: phoneAuthCubit!,
      //               child: OPTverify(phoneNumber: phoneNumber),
      //             ));

      case posters:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<UplodingDataCubit>.value(
                  value: uplodingDataCubit!,
                  child: const HomeScreen(),
                ));
    }
    return null;
  }
}
