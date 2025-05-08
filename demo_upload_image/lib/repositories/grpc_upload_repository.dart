import 'package:my_upload_package/generated/image.pb.dart';
import 'package:my_upload_package/uploader/grpc_uploader.dart';

abstract class GRPCUploadRepository {

  Future<UploadImageResponse> uploadImage(String filePath, int timestamp);
}

class GRPCUploadRepositoryImpl implements GRPCUploadRepository {
  final GrpcUploader grpcUploader;

  GRPCUploadRepositoryImpl(this.grpcUploader);

  @override
  Future<UploadImageResponse> uploadImage(String filePath, int timestamp) async {
    return await grpcUploader.uploadImage(filePath, timestamp);
  }
}
