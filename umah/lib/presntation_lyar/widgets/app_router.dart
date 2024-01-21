import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:umah/costanse/pages.dart';
import 'package:umah/presntation_lyar/screens/AudioScreen.dart';
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
      MyRepo myRepoInstance = MyRepo(NameWebServise());
    uplodingDataCubit = UplodingDataCubit(myRepoInstance);
    emailAuthCubit = EmailAuthCubit(myRepoInstance,);
    getMethodCubit = GetMethodCubit(myRepoInstance,emailAuthCubit ?? EmailAuthCubit(myRepoInstance));
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logain:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<EmailAuthCubit>.value(
                  value: emailAuthCubit!,
                  child: const HomeScreen(),
                ));
        case Optpage:
         return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider<UplodingDataCubit>.value(value: uplodingDataCubit!),
        BlocProvider<EmailAuthCubit>.value(value: emailAuthCubit!)
      ],
      child: AudioScreen(email: '', password: '',),
    ),);

      case posters:
        return MaterialPageRoute(
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider<GetMethodCubit>.value(value: getMethodCubit!),
        BlocProvider<EmailAuthCubit>.value(value: emailAuthCubit!)
      ],
      child: LoginScreen(email: '', password: '',),
    ),
  );
     }
    return null;
  }
}
