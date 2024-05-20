import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/data/models/status/form_status.dart';

// ignore: must_be_immutable
class GetFilesState extends Equatable {
  final List<dynamic> fileData;
  final List<dynamic> folderData;
  final String filesMessage;
  final String foldersMessage;
  final FormStatus status;
  final XFile? file;
  final String? folderName;

  const GetFilesState({
    this.status = FormStatus.pure,
    required this.fileData,
    required this.folderData,
    required this.filesMessage,
    required this.foldersMessage,
    this.file,
    this.folderName
  });

  GetFilesState copyWith({
    List<dynamic>? fileData,
    List<dynamic>? folderData,
    String? filesMessage,
    String? foldersMessage,
    XFile? file,
    FormStatus? status,
    String? folderName,
  }) =>
      GetFilesState(
        fileData: fileData ?? this.fileData,
        folderData: folderData ?? this.folderData,
        filesMessage: filesMessage ?? this.foldersMessage,
        foldersMessage: foldersMessage ?? this.foldersMessage,
        file: file ?? this.file,
        status: status ?? this.status,
        folderName: folderName ?? folderName,
      );

  @override
  List<Object?> get props => [
    fileData,
    folderData,
    foldersMessage,
    filesMessage,
    file,
    folderName,
    status,
  ];
}