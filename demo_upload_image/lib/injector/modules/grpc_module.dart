import 'package:demo_upload_image/configs/app_config/app_config.dart';

import '../injector.dart';
import 'package:my_upload_package/uploader/grpc_uploader.dart';
import 'package:grpc/grpc.dart';

class GRPCModule {
  GRPCModule._();

  static void init() {
    final injector = Injector.instance;
    final channel = ClientChannel(
      AppConfig.baseUrlGRPCServer,
      port: AppConfig.grpcPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    injector.registerSingleton<ClientChannel>(channel);
    injector.registerSingleton<GrpcUploader>(GrpcUploader(channel));

  }
}