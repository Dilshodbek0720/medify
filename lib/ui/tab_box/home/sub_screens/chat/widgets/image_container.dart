import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key, required this.images, required this.dateTime});

  final List<String> images;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            bottomLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: images.length == 1 ? 1 : 2,
                    // crossAxisSpacing: 5.w,
                    // mainAxisSpacing: 5.w,
                    // childAspectRatio: 1.3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ...List.generate(
                        images.length.isEven
                            ? images.length
                            : images.length - 1,
                        (index) {
                          return GridTile(
                            child: ClipRRect(
                              // borderRadius: BorderRadius.circular(40.r),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r)),
                                // height: 120.w,
                                // width: 120.w,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Scaffold(
                                            body: PhotoView(
                                              imageProvider: FileImage(
                                                  File(images[index])),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Image.file(
                                    File(images[index]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  images.length.isOdd
                      ? GridTile(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Scaffold(
                                      body: PhotoView(
                                        imageProvider:
                                            FileImage(File(images.last)),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Image.file(
                              File(images.last),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h,right: 5.w),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: AppColors.c_700.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      dateTime.substring(10, 16),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
