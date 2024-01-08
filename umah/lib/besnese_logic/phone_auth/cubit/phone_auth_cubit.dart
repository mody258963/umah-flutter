import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> sumbitPhoneNumbr(String phoneNumber) async {
    emit(Loading());
  }

  void submitOPT(String s) {}
}
