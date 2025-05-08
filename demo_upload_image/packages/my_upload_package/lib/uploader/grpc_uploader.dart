import 'dart:io';
import 'package:fixnum/src/int64.dart';
import 'package:grpc/grpc.dart';

import '../generated/image.pbgrpc.dart';

class GrpcUploader {
  final ImageUploadServiceClient client;

  GrpcUploader(ClientChannel channel)
      : client = ImageUploadServiceClient(channel);

  Future<UploadImageResponse> uploadImage(String filePath, int timestamp) async {
    final file = File(filePath);
    final bytes = await file.readAsBytes();

    final metadata = ImageMetadata()
      ..filename = file.uri.pathSegments.last
      ..contentType = file.path.split('.').last
      ..sizeBytes = Int64(bytes.length)
      ..uploadedBy = "tannv5"
      ..description = "upload at $timestamp";

    final request = UploadImageRequest()
      ..metadata = metadata
      ..imageData = bytes;

    return await client.uploadImage(request);
  }
}
