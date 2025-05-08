abstract class UploadState{}

class UploadInitialState extends UploadState {}

class UploadLoadingState extends UploadState {}

class UploadSuccessState extends UploadState {
  final String message;

  UploadSuccessState(this.message);
}

class UploadErrorState extends UploadState {
  final String error;

  UploadErrorState(this.error);
}