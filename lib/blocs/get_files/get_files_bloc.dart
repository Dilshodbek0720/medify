import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/blocs/get_files/get_files_state.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/file_url_model/file_url_model.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/repository/file_repository.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'get_files_event.dart';

class GetFilesBloc extends Bloc<FilesEvent, GetFilesState> {
  GetFilesBloc({required this.fileRepository})
      : super(const GetFilesState(
      foldersMessage: "",
      filesMessage: "",
      fileData: [],
      folderData: [],
      file: null,
      folderName: "",
    ),

  ) {
    on<GetFilesEvent>(getCustomerFiles);
    on<UploadFileToCloud>(uploadFileToCloud);
    on<UploadToInnerFolder>(uploadToInnerFolder);
    on<AddFolder>(addFolder);
    add(GetFilesEvent());
  }

  final FileRepository fileRepository;

  Future<void> getCustomerFiles(
      GetFilesEvent getFilesEvent, Emitter<GetFilesState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData response = await fileRepository.getCustomerFiles(token: StorageRepository.getString(StorageKeys.userToken),);
    print(response.data);
    if (response.error.isEmpty) {
      List<FileUrlModel> filesModels = (response.data["files_url"] as List?)?.map((e) => FileUrlModel.fromJson(e)).toList() ?? [];
      emit(
        state.copyWith(
          status: FormStatus.success,
          folderData: response.data['folder_data'],
          fileData: filesModels,
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

  void uploadFileToCloud(UploadFileToCloud event, Emitter<GetFilesState> emit) async{
    emit(state.copyWith(status: FormStatus.loading));
    print("file Name: ${state.file!.path}");
    UniversalData data = await fileRepository.uploadFileToCloud(
      token: StorageRepository.getString(StorageKeys.userToken),
      file: state.file!,
    );
    add(GetFilesEvent());
    emit(state);
  }

  void uploadToInnerFolder(UploadToInnerFolder event, Emitter<GetFilesState> emit) async{
    emit(state.copyWith(status: FormStatus.loading));
    print("file Name: ${state.file!.path}");
    UniversalData data = await fileRepository.uploadToInnerFolder(
      token: StorageRepository.getString(StorageKeys.userToken),
      folderName: "Sunnatilla-Akfa-Medline",
      file: state.file!,
    );
    add(GetFilesEvent());
    emit(state);
  }

  void addFolder(AddFolder event, Emitter<GetFilesState> emit) async{
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data = await fileRepository.createNewFolder(
      folderName: state.folderName!,
      token: StorageRepository.getString(StorageKeys.userToken),
    );
    add(GetFilesEvent());
    emit(state);
  }
}