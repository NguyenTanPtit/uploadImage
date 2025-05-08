import 'package:demo_upload_image/features/send_file/bloc/upload_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/grpc_upload_repository.dart';

class UploadCubit extends Cubit<UploadState> {
  final GRPCUploadRepository fileRepository;

  UploadCubit({required this.fileRepository}) : super(UploadInitialState());

  Future<void> uploadFile(String filePath, int timeStamp) async {
    try {
      emit(UploadLoadingState());
      final result = await fileRepository.uploadImage(filePath,timeStamp);
      if(result.hasImageId()) {
        emit(UploadSuccessState(result.imageId));
      }else{
        emit(UploadErrorState("Dont have image id"));
      }
    } catch (e) {
      emit(UploadErrorState(e.toString()));
    }
  }
}