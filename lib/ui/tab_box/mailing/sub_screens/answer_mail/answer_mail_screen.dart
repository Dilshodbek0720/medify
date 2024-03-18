import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medify/blocs/email_message_file/email_message_file_bloc.dart';
import 'package:medify/blocs/email_message_file/email_message_file_state.dart';
import 'package:medify/data/models/message/message_model.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/image_container.dart';
import 'package:medify/ui/tab_box/mailing/sub_screens/answer_mail/widgets/email_file_dialog.dart';
import 'package:medify/ui/tab_box/mailing/sub_screens/answer_mail/widgets/email_folder_card.dart';
import 'package:medify/ui/tab_box/mailing/sub_screens/answer_mail/widgets/email_image_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';

class AnswerMailScreen extends StatefulWidget {
  const AnswerMailScreen({super.key});

  @override
  State<AnswerMailScreen> createState() => _AnswerMailScreenState();
}
List<String> files = ['Files', 'Storage'];

class _AnswerMailScreenState extends State<AnswerMailScreen> {
  TextEditingController sendController = TextEditingController(text: 'Re: Welcome to CodingMonk online learning platform');
  TextEditingController textController = TextEditingController(text: '');
  String dropdownValue = files.first;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        action: [
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: DropdownButton<String>(
              elevation: 2,
              underline: const SizedBox(),
              dropdownColor: AppColors.primary100,
              icon: SvgPicture.asset(
                AppIcons.paperClip,
                width: 24.w,
                colorFilter: const ColorFilter.mode(AppColors.c_900, BlendMode.srcIn),
              ),
              items: files.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c_900,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
                if(dropdownValue == "Files"){
                  emailFileDialog(context, picker: picker);
                }else{
                  Navigator.pushNamed(context, RouteNames.storageDetailScreen, arguments: true);
                }
              } // Placeholder text
            )
          ),
          4.pw,
          IconButton(onPressed: (){ }, icon: Icon(Icons.send, size: 24.w, color: AppColors.blueGrey,)),
          IconButton(onPressed: (){ }, icon: Icon(Icons.more_vert, size: 24.w, color: AppColors.c_900,)),
          4.pw,
        ],
      ),
      body: BlocBuilder<EmailMessageFileBloc, EmailMessageFileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text('Kimdan', style: TextStyle(
                          color: AppColors.c_700,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp
                      ),),
                      24.pw,
                      Text('sayitqulovdilshodbek@gmail.com', style: TextStyle(
                        color: AppColors.c_800,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp
                      ),)
                    ],
                  ),
                ),
                24.ph,
                Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text('Kimga', style: TextStyle(
                          color: AppColors.c_700,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp
                      ),),
                      24.pw,
                      GestureDetector(
                        onTap: (){
            
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            border: Border.all(width: 1, color: AppColors.c_700),
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.c_600,
                                  borderRadius: BorderRadius.circular(100.r)
                                ),
                                height: 50.r,
                                width: 50.r,
                                margin: const EdgeInsets.all(1),
                                padding: EdgeInsets.all(14.r),
                                child: Center(
                                  child: Text('C', style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.sp
                                  ),),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text('CodingMonk', style: TextStyle(
                                    color: AppColors.c_900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp
                                ),),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
                16.ph,
                const Divider(height: 0.6, color: AppColors.c_500),
                Padding(padding: EdgeInsets.all(16.r),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Matn',
                      hintStyle: TextStyle(
                          color: AppColors.c_700,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.white
                          )
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.white
                          )
                      ),
                    ),
                    controller: sendController,
                    style: TextStyle(
                        color: AppColors.c_800,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp
                    ),
                    minLines: 1,
                    maxLines: 20,
                  )
                ),
                const Divider(height: 0.6, color: AppColors.c_500),
                Padding(padding: EdgeInsets.all(16.r),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Matn',
                        hintStyle: TextStyle(
                            color: AppColors.c_700,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.white
                          )
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.white
                            )
                        ),
                      ),
                      controller: textController,
                      style: TextStyle(
                          color: AppColors.c_800,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp
                      ),
                      minLines: 1,
                      maxLines: 20,
                    )
                ),
                ...List.generate(state.messages.length, (index) {
                  MessageModel messageModel = state.messages[index];
                  return messageModel.image != null ? EmailImageCard(
                    images: messageModel.image ?? [],
                    dateTime: messageModel.dateTime,
                  ) : messageModel.folder != null ? EmailFolderCard(folder: messageModel.folder ?? '') : const SizedBox();
                })
              ],
            ),
          );
        }
      ),
    );
  }
}
