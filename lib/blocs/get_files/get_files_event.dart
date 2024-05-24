import 'package:file_picker/file_picker.dart';

abstract class FilesEvent {}

class GetFilesEvent extends FilesEvent {}

class UploadFileToCloud extends FilesEvent{

  UploadFileToCloud();
}

class UploadToInnerFolder extends FilesEvent{

  UploadToInnerFolder();
}

class AddFiles extends FilesEvent{

  AddFiles();
}

class AddFolder extends FilesEvent{

  AddFolder();
}