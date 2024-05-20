import 'package:file_picker/file_picker.dart';

abstract class FilesEvent {}

class GetFilesEvent extends FilesEvent {}

class UploadFile extends FilesEvent{
  final PlatformFile file;

  UploadFile({required this.file});
}

class AddFiles extends FilesEvent{

  AddFiles();
}

class AddFolder extends FilesEvent{

  AddFolder();
}