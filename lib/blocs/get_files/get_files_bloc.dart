import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/blocs/get_files/get_files_state.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/repository/file_repository.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import '../../data/local/storage_repository/storage_repository.dart';
import 'get_files_event.dart';

class GetFilesBloc extends Bloc<FilesEvent, GetFilesState> {
  GetFilesBloc({required this.fileRepository})
      : super(GetFilesState(
      foldersMessage: "",
      filesMessage: "",
      fileData: [],
      folderData: [],
      file: null,
      folderName: ""
    ),
  ) {
    on<GetFilesEvent>(getCustomerFiles);
    on<AddFiles>(addFiles);
  }

  final FileRepository fileRepository;

  Future<void> getCustomerFiles(
      GetFilesEvent getFilesEvent, Emitter<GetFilesState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData response = await fileRepository.getCustomerFiles(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjRiMjkxMzEyZDcxMmQ1NDBlMDhlMTMiLCJlbWFpbCI6InNheWl0cXVsb3ZkaWxzaG9kYmVrQGdtYWlsLmNvbSIsImlhdCI6MTcxNjIwMTc0OCwiZXhwIjoxNzE2Mjg4MTQ4fQ.pPhIUmtb8UTkVHlCbOGFfhfG_ukfol_BI7tlyMQ29mg"
    // StorageRepository.getString(StorageKeys.userToken),
    );
    print(response.data);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          folderData: response.data['folder_data'],
          fileData: response.data['file_data'],
          filesMessage: response.data['files_message'],
          foldersMessage: response.data['folders_message']
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
        ),
      );
    }
  }

  void updateFolderName(String? folderName){
    emit(state.copyWith(folderName: folderName));
  }

  void updateFile(XFile? file) {
    emit(state.copyWith(file: file));
  }

  void addFiles(AddFiles event, Emitter<GetFilesState> emit) async{
    print("file Name: ${state.file!.path}");
    UniversalData data = await fileRepository.uploadFileToCloud(
      token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjRiMjkxMzEyZDcxMmQ1NDBlMDhlMTMiLCJlbWFpbCI6InNheWl0cXVsb3ZkaWxzaG9kYmVrQGdtYWlsLmNvbSIsImlhdCI6MTcxNjIwMTc0OCwiZXhwIjoxNzE2Mjg4MTQ4fQ.pPhIUmtb8UTkVHlCbOGFfhfG_ukfol_BI7tlyMQ29mg",
      file: state.file!,
    );
    emit(state);
  }

  void addFolder(AddFolder event, Emitter<GetFilesState> emit) async{
    UniversalData data = await fileRepository.createNewFolder(
      folderName: state.folderName!,
      token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NjRiMjkxMzEyZDcxMmQ1NDBlMDhlMTMiLCJlbWFpbCI6InNheWl0cXVsb3ZkaWxzaG9kYmVrQGdtYWlsLmNvbSIsImlhdCI6MTcxNjIwMTc0OCwiZXhwIjoxNzE2Mjg4MTQ4fQ.pPhIUmtb8UTkVHlCbOGFfhfG_ukfol_BI7tlyMQ29mg",
    );
    emit(state);
  }

}