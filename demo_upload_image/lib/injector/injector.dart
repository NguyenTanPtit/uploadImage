import 'package:demo_upload_image/injector/modules/grpc_module.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_guide_ai/repositories/login_repo/login_repo.dart';
import 'package:get_it/get_it.dart';
// import 'package:rest_client/protos/login/login_api.dart';

import 'modules/bloc_module.dart';
import 'modules/database_module.dart';
import 'modules/dio_module.dart';
import 'modules/repository_module.dart';
import 'modules/rest_client_module.dart';
import 'modules/service_module.dart';

class Injector {
  Injector._();

  static GetIt instance = GetIt.instance;

  static Future<void> init() async {
    await DatabaseModule.init();
    DioModule.init();
    RepositoryModule.init();
    RestClientModule.init();
    ServiceModule.init();
    BlocModule.init();
    GRPCModule.init();
  }
}
