import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/tab_box/home/widgets/date_formatter.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class FileContainer extends StatefulWidget {
  const FileContainer({super.key, required this.filePath, required this.dateTime, required this.onTap});
  final String filePath;
  final String dateTime;
  final VoidCallback onTap;

  @override
  State<FileContainer> createState() => _FileContainerState();
}

class _FileContainerState extends State<FileContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
          color: AppColors.audioBackground, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              6.pw,
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.8)
                  ),
                  child: IconButton(
                    onPressed: widget.onTap,
                    icon: Icon(
                      Icons.folder,
                      size: 24.w,
                    ),
                  ),
                ),
              ),
              10.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.filePath.substring(45),
                    style: TextStyle(
                      fontSize: 12.sp
                  ),),
                  Text('880.3 KB', style: TextStyle(
                      fontSize: 12.sp
                  ),),
                ],
              ),
              10.pw,
            ],
          ),
          4.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.dateTime,
                style: TextStyle(
                    fontSize: 12.sp
                ),
              ),
              8.pw
            ],
          )
        ],
      ),
    );
  }
}
