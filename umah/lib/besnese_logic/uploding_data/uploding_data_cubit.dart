import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umah/web_servese/reproserty/myRepo.dart';

import 'uploding_data_state.dart';

class UplodingDataCubit extends Cubit<UplodingDataState> {
  final MyRepo myRepo;
  UplodingDataCubit(this.myRepo) : super(UplodingDataInitial());

  final List<String> UrlPhotos = [];
  Future<void> uploadAudio(File data, String title ,String duration) async {
    emit(Loading());
    try {
      FormData formData = FormData.fromMap({
        'audio': await MultipartFile.fromFile(
          data.path,
        ),
        // Additional parameters, if any
        '': 'value',
      });
      List<dynamic> getfile = await myRepo.audioUpload('audios/store', data);
      emit(GetDataFromUi(data:data));
    } catch (e) {}

    Future<void> uploadImagesAndSaveUrls(List<File> images) async {
      emit(Loading());
      try {} catch (error) {}
    }
  }
}
