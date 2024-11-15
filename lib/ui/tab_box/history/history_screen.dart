import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/blocs/get_files/get_files_bloc.dart';
import 'package:medify/blocs/get_files/get_files_event.dart';
import 'package:medify/blocs/get_files/get_files_state.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/status/form_status.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/history/widgets/create_folder_dialog.dart';
import 'package:medify/ui/tab_box/history/widgets/history_appbar.dart';
import 'package:medify/ui/tab_box/history/widgets/storage_drawer.dart';
import 'package:medify/ui/tab_box/history/widgets/storage_file_item.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/storage/sub_screens/pdf_viewer_screen/pdf_viewer_screen.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/ui_utils/loading_dialog.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int screenIndex = 0;
  bool isSelected = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    context.read<GetFilesBloc>().add(GetFilesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: BlocConsumer<GetFilesBloc, GetFilesState>(
            builder: (context, fileState) {
          return Scaffold(
            drawer: StorageDrawerWidget(
              cancelOnTap: () {
                _closeDrawer();
              },
              onChanged: (int value) {
                if (value == 11) {
                } else {
                  setState(() {
                    screenIndex = value;
                  });
                }
                Navigator.pop(context);
              },
              selectedIndex: screenIndex,
            ),
            key: _scaffoldKey,
            appBar: HistoryAppbar(
              onTapOpen: () {
                _openDrawer();
              },
            ),
            body: TabBarView(children: [
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Text(fileState.foldersMessage,
                            style: TextStyle(
                                color: AppColors.c_900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Expanded(child: ListView(
                    children: [
                      ...List.generate(fileState.folderData.length, (folderIndex) {
                        return StorageFileItem(
                          folderName: fileState.folderData[folderIndex],
                          description: "Вы открывали * 12 нояр. 2023 г.",
                          isFile: false,
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.folderDetailScreen, arguments: fileState.folderData[folderIndex]);
                          },
                        );
                      })
                    ],
                  ))
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Text(fileState.filesMessage,
                            style: TextStyle(
                                color: AppColors.c_900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Expanded(child: ListView(
                    children: [
                      ...List.generate(fileState.fileData.length, (fileIndex) {
                        return StorageFileItem(
                          folderName: fileState.fileData[fileIndex].filename,
                          description: "Вы открывали * 12 нояр. 2023 г.",
                          onTap: (){
                            String fileName = fileState.fileData[fileIndex].filename.split('/').last;
                            String fileExtension = fileName.split('.').last.toLowerCase();
                            if(fileExtension == "pdf") {
                              Navigator.pushNamed(context, RouteNames.pdfViewerScreen, arguments: fileState.fileData[fileIndex].fileUrl);
                            } else {
                              Navigator.pushNamed(context, RouteNames.imageViewerScreen, arguments: fileState.fileData[fileIndex].fileUrl);
                            }
                          },
                          isFile: true,
                        );
                      }),
                    ],
                  ))
                ],
              ),
            ]),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoActionSheet(
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            Navigator.pop(context);
                            createFolderDialog(context: context);
                          },
                          child: const Text(
                            'Open Folder',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () async {
                            await _openFilePicker(context);
                            // context.read<GetFilesBloc>().updateFile(
                            //     await _openFilePicker(context)
                            // );
                            // context.read<GetFilesBloc>().add(AddFiles());
                          },
                          child: const Text(
                            'File Upload',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  },
                );
                // createFolderDialog(context: context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r)),
              backgroundColor: AppColors.primary100,
              child: const Icon(
                Icons.add,
                color: AppColors.c_900,
              ),
            ),
          );
        }, listener: (BuildContext context, GetFilesState state) {
              // if(state.status == FormStatus.loading){
              //   showDialog(
              //       context: context,
              //       barrierDismissible: false,
              //       builder: (BuildContext context) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       });             }
                      },
        ),

      ),
    );
  }

  Future<XFile?> _openFilePicker(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null && context.mounted) {
        XFile xFile = result.files.first.xFile;
        context.read<GetFilesBloc>().updateFile(xFile);
        print(xFile.path);
        context.read<GetFilesBloc>().add(UploadToInnerFolder());
        print('File picked: ${result.files.first.path}');
        return result.files.first.xFile;
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      // Handle exception
      print('Error picking file: $e');
    }
    return null;
  }
}
