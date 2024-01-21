import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/besnese_logic/email_auth/email_auth_cubit.dart';
import 'package:umah/besnese_logic/get_method/get_method_state.dart';
import 'package:umah/web_servese/dio/web_serv.dart';
import 'package:umah/web_servese/model/course.dart';
import 'package:umah/web_servese/reproserty/myRepo.dart';

import '../../web_servese/model/username.dart';

class GetMethodCubit extends Cubit<GetMethodState> {
  final MyRepo myRepo;
  List<User>? myallUsers;
  EmailAuthCubit emailAuthCubit;
  GetMethodCubit(this.myRepo, this.emailAuthCubit) : super(GetMethodInitial());

  Future<FutureOr<void>> emitGetAllUSers() async {
    try {
      emit(LodingState());
      List<User> posts = await myRepo.getAllUsers('all-user');
      emit(AllItemsState(posts: posts));
    } catch (e) {
      print('========cubits=======${e.toString()}');
    }
  }

  Future<FutureOr<void>> emitGetAllCourseOfUser(String id) async {
    try {
      print('======get=======$id');
      emit(LodingState());
      List<Course> posts = await myRepo.getAllCourseOfUser('get-course/user/$id');
      print('===posts====$posts');
      emit(CourseOfUserState(posts: posts));
    } catch (e) {
      print('========cubits=======${e.toString()}');
    }
  }
}
// emit(state.copyWith(isLoading: true));
	