import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';

class FolderDetailScreen extends StatefulWidget {
  const FolderDetailScreen({super.key, required this.folderName});
  final String folderName;

  @override
  State<FolderDetailScreen> createState() => _FolderDetailScreenState();
}

class _FolderDetailScreenState extends State<FolderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: 'Folder Detail',
      ),
      body: Column(
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Row(
              children: [
                Text("В хранилище пользователя N файлов",
                    style: TextStyle(
                        color: AppColors.c_900,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
