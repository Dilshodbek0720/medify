import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medify/ui/tab_box/history/widgets/create_folder_dialog.dart';
import 'package:medify/ui/tab_box/history/widgets/history_appbar.dart';
import 'package:medify/ui/tab_box/history/widgets/storage_drawer.dart';
import 'package:medify/ui/tab_box/history/widgets/storage_file_item.dart';
import 'package:medify/ui/tab_box/history/widgets/storage_open_file.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: StorageDrawerWidget(cancelOnTap: (){
            _closeDrawer();
          }, onChanged: (int value) {
            if(value==11){

            }else{
              setState(() {
                screenIndex = value;
              });
            }
            Navigator.pop(context);
          }, selectedIndex: screenIndex,),
          key: _scaffoldKey,
          appBar: HistoryAppbar(
            onTapOpen: (){
              _openDrawer();
            },
          ),
          body: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  children: [
                    Text("Files",style: TextStyle(
                        color: AppColors.c_900,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600
                    )),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isSelected = isSelected ? false : true;
                          print('object');
                        });
                      },
                      child: SizedBox(
                        width: 26.w,
                        height: 26.w,
                        child: SvgPicture.asset(AppIcons.drawer),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: ListView(
                children: [
                  isSelected ? const StorageOpenFile(dateTime: "19-fev, 2024", isFile: true, folderName: "Full Stack Web Developer.pdf", text: 'You created', image: AppIcons.pdfDemoImage,) : const StorageFileItem(folderName: "Full Stack Web Developer.pdf", description: "Вы открывали * 12 нояр. 2023 г.", isFile: true,),
                  isSelected ? const StorageOpenFile(dateTime: "19-fev, 2024", isFile: false, folderName: "Full Stack Web Developer.jpg", text: 'You created', image: AppIcons.hospital,) : const StorageFileItem(folderName: "Full Stack Web Developer.jpg", description: "Вы открывали * 12 нояр. 2023 г.", isFile: false,),
                  isSelected ? const StorageOpenFile(dateTime: "19-fev, 2024", isFile: true, folderName: "Full Stack Web Developer.pdf", text: 'You created', image: AppIcons.pdfDemoImage,) : const StorageFileItem(folderName: "Full Stack Web Developer.pdf", description: "Вы открывали * 12 нояр. 2023 г.", isFile: true,),
                ],
              ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              createFolderDialog(context: context);
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
            backgroundColor: AppColors.primary100,
            child: const Icon(Icons.add, color: AppColors.c_900,),
          ),
        ),
      ),
    );
  }
}
