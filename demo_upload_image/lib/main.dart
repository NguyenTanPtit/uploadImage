import 'package:demo_upload_image/features/send_file/bloc/upload_cubit.dart';
import 'package:demo_upload_image/repositories/grpc_upload_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/send_file/view/upload_image_screen.dart';
import 'injector/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final  uploadRepository = GetIt.instance<GRPCUploadRepository>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(create: (context)=> UploadCubit(fileRepository: uploadRepository),
      child: const FileUploadScreen())
    );
  }
}


