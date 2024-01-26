import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/utils/size/screen_size.dart';

class GalleryImageItem extends StatefulWidget {
  const GalleryImageItem({super.key, required this.onTap, required this.image});
  final VoidCallback onTap;
  final String image;

  @override
  State<GalleryImageItem> createState() => _GalleryImageItemState();
}

class _GalleryImageItemState extends State<GalleryImageItem> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(6.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: widget.onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: SizedBox(
            height: 118*height/figmaHeight,
            width: 118*height/figmaHeight,
            child: Image.asset(widget.image, fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
