import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/screen_size.dart';
import 'package:medify/utils/ui_utils/loading_dialog.dart';

void profileDialog({
  required BuildContext context,
  required ValueChanged<String> valueChanged,
}) {
  final ImagePicker picker = ImagePicker();
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.c_50,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.c_900, width: 2),
                    borderRadius: BorderRadius.circular(16.r)),
                child: ListTile(
                  onTap: () async {
                    await _getFromCamera(
                        picker: picker,
                        context: context,
                        valueChanged: (v) {
                          valueChanged(v);
                        });
                    if (context.mounted) Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    color: AppColors.c_900,
                  ),
                  title: Text(
                    "Select from camera",
                    style: TextStyle(color: AppColors.c_900, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.c_900, width: 2)),
                child: ListTile(
                  onTap: () async {
                    await _getFromGallery(
                        picker: picker,
                        context: context,
                        valueChanged: (v) {
                          valueChanged(v);
                        });
                    if (context.mounted) Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.photo,
                    color: AppColors.c_900,
                  ),
                  title: Text(
                    'Select from gallery',
                    style: TextStyle(color: AppColors.c_900, fontSize: 20.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Future<void> _getFromCamera({
  required ImagePicker picker,
  required BuildContext context,
  required ValueChanged<String> valueChanged,
}) async {
  XFile? xFile = await picker.pickImage(
    source: ImageSource.camera,
    maxHeight: 512 * height / figmaHeight,
    maxWidth: 512 * width / figmaWidth,
  );

  if (xFile != null && context.mounted) {
    showLoading(context: context);
    // UniversalData data = await imageUploader(xFile);
    if (!context.mounted) return;
    hideLoading(context: context);

    // if (context.mounted &&
    //     StorageRepository.getString(StorageKeys.userRole) ==
    //         AppConstants.driver) {
    //   context.read<DriverBloc>().updateDriverField(
    //       fieldKey: DriverFieldKeys.imageUrl, value: data.data);
    //   if (!StorageRepository.getBool(StorageKeys.isFromNavigate)) {
    //     context.read<DriverBloc>().add(UpdateDriverEvent());
    //   }
    // } else if (context.mounted) {
    //   context.read<UserBloc>().add(UpdateCurrentUserEvent(
    //       fieldKey: UserFieldKeys.image, value: data.data));
    //   if (!StorageRepository.getBool(StorageKeys.isFromNavigate)) {
    //     context.read<UserBloc>().add(UpdateUserEvent());
    //   }
    // }

    valueChanged(xFile.path);
  }
}

Future<void> _getFromGallery(
    {required ImagePicker picker,
    required BuildContext context,
    required ValueChanged<String> valueChanged}) async {
  XFile? xFile = await picker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 512 * height / figmaHeight,
    maxWidth: 512 * width / figmaWidth,
  );
  if (xFile != null && context.mounted) {
    // showLoading(context: context);
    // UniversalData data = await imageUploader(xFile);
    // if (!context.mounted) return;
    // hideLoading(context: context);
    // if (context.mounted &&
    //     StorageRepository.getString(StorageKeys.userRole) ==
    //         AppConstants.driver) {
    //   context.read<DriverBloc>().updateDriverField(
    //       fieldKey: DriverFieldKeys.imageUrl, value: data.data);
    //   if (!StorageRepository.getBool(StorageKeys.isFromNavigate)) {
    //     context.read<DriverBloc>().add(UpdateDriverEvent());
    //   }
    // } else if (context.mounted) {
    //   context.read<UserBloc>().add(UpdateCurrentUserEvent(
    //       fieldKey: UserFieldKeys.image, value: data.data));
    //   if (!StorageRepository.getBool(StorageKeys.isFromNavigate)) {
    //     context.read<UserBloc>().add(UpdateUserEvent());
    //   }
    // }

    valueChanged(xFile.path);
    debugPrint("Success");
  }
}
