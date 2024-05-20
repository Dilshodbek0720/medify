import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/blocs/get_files/get_files_bloc.dart';
import 'package:medify/blocs/get_files/get_files_event.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/data/models/universal_data.dart';
import 'package:medify/data/network/api_service.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/size/size_extension.dart';

void createFolderDialog({required BuildContext context}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context,state){
          String folderName = '';
          return AlertDialog(
            backgroundColor: const Color(0xFFEFF2FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            content: SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New folder', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp
                  ),),
                  20.ph,
                  TextField(
                    onTapOutside: (event) {
                      // FocusManager.instance.primaryFocus?.unfocus();
                    },
                    onChanged: (v){
                      context.read<GetFilesBloc>().updateFolderName(v);
                      print(context.read<GetFilesBloc>().state.folderName);
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      labelStyle: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_900,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c_500,
                      ),
                      hintText: "New folder",
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                          borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      fillColor: const Color(0xFFEFF2FB),
                      filled: true,
                    ),
                    style: TextStyle(color: AppColors.dark3, fontSize: 16.sp, fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Bekor qilish",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 16.sp,
                      color: AppColors.primary
                  ),
                ),
              ),
              TextButton(
                onPressed: ()async{
                  ApiService apiService = ApiService();
                  context.read<GetFilesBloc>().add(AddFolder());
                  UniversalData data = await apiService.createNewFolder(token: StorageRepository.getString(StorageKeys.userToken), folderName: folderName);
                  String message = data.data;
                  if(message.isNotEmpty){
                    print(message);
                    print(StorageRepository.getString(StorageKeys.userToken));
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  "Create",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 16.sp,
                      color: AppColors.primary
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}