import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/get_method/get_method_state.dart';
import 'package:umah/web_servese/dio/web_serv.dart';
import 'package:umah/web_servese/reproserty/myRepo.dart';

import '../../web_servese/model/username.dart';

class GetMethodCubit extends Cubit<GetMethodState> {
  final MyRepo myRepo;
  List<User>? myallUsers;
  GetMethodCubit(this.myRepo) : super(GetMethodInitial());

  Future<FutureOr<void>> emitGetAllUSers() async {
    try {
      emit(LodingState());
      List<User> posts = await myRepo.getAllUsers('all-user');
      emit(AllItemsState(posts: posts));
    } catch (e) {
      print('========cubits=======${e.toString()}');
    }
  }
}
// emit(state.copyWith(isLoading: true));
	