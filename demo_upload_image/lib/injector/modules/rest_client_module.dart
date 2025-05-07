
// import 'package:rest_client/protos/login/login_api.dart';

import '../injector.dart';
import 'dio_module.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;

    //
    // injector.registerFactory<LoginApi>(
    //       () => LoginApi(
    //     injector(instanceName: DioModule.dioInstanceName),
    //   ),
    // );

  }
}
