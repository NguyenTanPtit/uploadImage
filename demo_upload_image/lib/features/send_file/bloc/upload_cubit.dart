import 'dart:developer';

import 'package:demo_upload_image/features/send_file/bloc/upload_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/grpc_upload_repository.dart';

class UploadCubit extends Cubit<UploadState> {
  final GRPCUploadRepository fileRepository;

  UploadCubit({required this.fileRepository}) : super(UploadInitialState());

  Future<void> uploadFile(String filePath, int timeStamp) async {
    try {
      emit(UploadLoadingState());
      final startTime = DateTime.now();
      log('Upload started at: $startTime');
      final result = await fileRepository.uploadImage(filePath,timeStamp);
      if(result.hasImageId()) {
        final endTime = DateTime.now();
        log('Upload ended at: $endTime');
        log('Total upload duration: ${endTime.difference(startTime).inMilliseconds} ms');
        emit(UploadSuccessState(result.imageId));
      }else{
        emit(UploadErrorState("Dont have image id"));
      }
    } catch (e) {
      log(e.toString());
      emit(UploadErrorState(e.toString()));
    }
  }
}