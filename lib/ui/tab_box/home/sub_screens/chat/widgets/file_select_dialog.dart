import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/blocs/messages/message_bloc.dart';
import 'package:medify/blocs/messages/message_event.dart';
import 'package:medify/data/models/message/message_model.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/folder_item.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

void fileSelectDialog(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        child: Column(
          children: [
            16.ph,
            DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.c_400
              ),
              child: SizedBox(
                width: 32.w,
                height: 4.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text('Файл', style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.c_900,
                fontWeight: FontWeight.w600,
                fontFamily: 'Urbanist'
              ),),
            ),
            Expanded(child: ListView(
              children: [
                FolderItem(onTap: (){
                }, icon: AppIcons.database, title: 'Внутреннее хранилище',description: 'Поиск в файловой системе', radius: 40.r,),
                FolderItem(onTap: (){ }, icon: AppIcons.folderIcon, title: 'Telegram',description: 'Поиск в папке приложения', radius: 40.r,),
                FolderItem(onTap: (){ }, icon: AppIcons.gallleryIcon, title: 'Галерея',description: 'Для отправки без сжатия', radius: 40.r,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                  child: Text('Недавние файлы', style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.c_900,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Urbanist'
                  ),),
                ),
                ...List.generate(10, (index) => FolderItem(onTap: (){
                  context.read<MessageBloc>().add(
                    SendMessage(
                        messageModel: MessageModel(
                          receiverName: '',
                          senderName: '',
                          dateTime: DateTime.now().toString().substring(10, 16),
                          folder: 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'
                        ),),
                  );
                  Navigator.pop(context);
                }, icon: AppIcons.folderIcon, title: 'file.pdf',description: '3,45 kb', radius: 8.r,))
              ],
            ))
          ],
        ),
      );
    },
  );
}