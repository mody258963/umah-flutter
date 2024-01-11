import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:umah/web_servese/reproserty/myRepo.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  final MyRepo myRepo;
  EmailAuthCubit(this.myRepo) : super(EmailAuthInitial());

  Future<FutureOr<void>> loginUser(String email, String password) async {
    emit(LoginLoading());

    try {
      List<dynamic> result = await myRepo
          .login('user/login', {'email': email, 'password': password});
      emit(LoginSuccess(userId: result));
    } catch (e) {
      emit(Loginfails());
      print('==email cubit===${e.toString()}');
    }
  }
}
