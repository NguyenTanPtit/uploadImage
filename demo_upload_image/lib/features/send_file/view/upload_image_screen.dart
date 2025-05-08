import 'dart:io';

import 'package:demo_upload_image/features/send_file/bloc/upload_cubit.dart';
import 'package:demo_upload_image/features/send_file/bloc/upload_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({Key? key}) : super(key: key);

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  PlatformFile? _selectedFile;
  String? _filePath;
  String? _fileSize;
  VideoPlayerController? _videoController;
  bool _isVideo = false;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _pickMedia() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'mov'], // Ảnh và video
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.single;
        _filePath = _selectedFile!.path;
        _fileSize = '${(_selectedFile!.size / 1024).toStringAsFixed(2)} KB';

        _isVideo = ['mp4', 'mov'].contains(_selectedFile!.extension?.toLowerCase());

        if (_isVideo) {
          _videoController?.dispose();
          _videoController = VideoPlayerController.file(File(_filePath!))
            ..initialize().then((_) {
              setState(() {});
              _videoController!.play();
            });
        } else {
          _videoController?.dispose();
          _videoController = null;
        }
      });
    }
  }

  void _uploadFile() {
    if (_filePath != null) {
      context.read<UploadCubit>().uploadFile(_filePath!, DateTime.now().millisecondsSinceEpoch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Media')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder hiển thị ảnh hoặc video
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _selectedFile != null
                      ? _isVideo && _videoController != null && _videoController!.value.isInitialized
                      ? VideoPlayer(_videoController!)
                      : _isVideo
                      ? const Center(child: Text('Video đang tải...'))
                      : Image.file(
                    File(_selectedFile!.path!),
                    fit: BoxFit.cover,
                  )
                      : const Center(child: Text('Chưa chọn media')),
                ),
                const SizedBox(height: 20),
                // Thông tin file
                if (_filePath != null) ...[
                  Text('Đường dẫn: $_filePath'),
                  Text('Kích thước: $_fileSize'),
                  Text('Loại: ${_isVideo ? 'Video' : 'Ảnh'}'),
                  const SizedBox(height: 20),
                ],
                // Nút chọn media
                ElevatedButton(
                  onPressed: _pickMedia,
                  child: const Text('Chọn Ảnh/Video'),
                ),
                const SizedBox(height: 10),
                // Nút upload
                BlocBuilder<UploadCubit, UploadState>(
                  builder: (context, state) {
                    if (state is UploadLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is UploadSuccessState) {
                      return Text('Upload thành công: ${state.message}');
                    } else if (state is UploadErrorState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _selectedFile != null ? _uploadFile : null,
                            child: const Text('Upload Media'),
                          ),
                          const SizedBox(width: 8),
                          Text('Upload thất bại: ${state.error}'),
                        ],
                      );
                    }
                    return ElevatedButton(
                      onPressed: _selectedFile != null ? _uploadFile : null,
                      child: const Text('Upload Media'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}