import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'uploding_data_state.dart';

class UplodingDataCubit extends Cubit<UplodingDataState> {
  UplodingDataCubit() : super(UplodingDataInitial());

  final List<String> UrlPhotos = [];
  Future<void> uploadData(Map<String, dynamic> data) async {
    emit(Loading());
    try {} catch (e) {}

    Future<void> uploadImagesAndSaveUrls(List<File> images) async {
      emit(Loading());
      try {

      } catch (error) {
     
      }
    }
  }
}
