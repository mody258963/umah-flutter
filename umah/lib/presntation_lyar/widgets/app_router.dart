
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:umah/costanse/pages.dart';
import 'package:umah/presntation_lyar/screens/HomeScreen.dart';
import 'package:umah/web_servese/model/web_serv.dart';
import 'package:umah/web_servese/reproserty/myRepo.dart';
import '../../besnese_logic/get_method/get_method_cubit.dart';
import '../../besnese_logic/uploding_data/uploding_data_cubit.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  UplodingDataCubit? uplodingDataCubit;
  GetMethodCubit? getMethodCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
    uplodingDataCubit = UplodingDataCubit();
    getMethodCubit = GetMethodCubit(MyRepo(NameWebServise()));
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case logain:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider<PhoneAuthCubit>.value(
      //             value: phoneAuthCubit!,
      //             child: const HomeScreen(),
      //           ));
    //   case Optpage:
    //     final phoneNumber = settings.arguments;
    //     return MaterialPageRoute(
    //         builder: (_) => BlocProvider<PhoneAuthCubit>.value(
    //               value: phoneAuthCubit!,
    //               child: OPTverify(phoneNumber: phoneNumber),
    //             ));

      case posters:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<GetMethodCubit>.value(
                  value: getMethodCubit!,
                  child: const HomeScreen(),
                ));
     }
     return null;
  }
}
