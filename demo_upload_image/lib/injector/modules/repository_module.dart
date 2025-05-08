// import 'package:flutter_guide_ai/repositories/login_repo/login_repo.dart';
// import 'package:rest_client/protos/login/login_api.dart';

import 'package:demo_upload_image/repositories/grpc_upload_repository.dart';
import 'package:my_upload_package/uploader/grpc_uploader.dart';

import '../injector.dart';

class RepositoryModule {
  static void init() {
    final injector = Injector.instance;

    // injector.registerLazySingleton<LoginRepository>(
    //       () => LoginRepositoryImpl(injector<LoginApi>()),
    // );
    injector.registerLazySingleton<GRPCUploadRepository>(
          () => GRPCUploadRepositoryImpl(injector<GrpcUploader>()),
    );

  }
}
