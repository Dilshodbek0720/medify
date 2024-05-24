import 'package:flutter/material.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                  child: PhotoViewGallery.builder(
                    backgroundDecoration: const BoxDecoration(color: AppColors.white),
                    itemCount: 1,
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(widget.imageUrl),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.contained * 6,
                      );
                    },
                  )),
              Positioned(
                child: Row(
                  children: [
                    10.pw,
                    getIcon(AppIcons.arrowLeft, context: context, onTap: () {
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}