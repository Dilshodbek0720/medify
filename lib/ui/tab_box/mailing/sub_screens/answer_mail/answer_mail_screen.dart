import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/size/size_extension.dart';

class AnswerMailScreen extends StatefulWidget {
  const AnswerMailScreen({super.key});

  @override
  State<AnswerMailScreen> createState() => _AnswerMailScreenState();
}

class _AnswerMailScreenState extends State<AnswerMailScreen> {
  TextEditingController sendController = TextEditingController(text: 'Re: Welcome to CodingMonk online learning platform');
  TextEditingController textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        action: [
          IconButton(onPressed: (){ }, icon: const Icon(Icons.send, color: AppColors.blueGrey,)),
          IconButton(onPressed: (){ }, icon: const Icon(Icons.more_vert)),
          4.pw,
        ],
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
