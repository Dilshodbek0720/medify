import 'package:flutter/material.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryDetailScreen extends StatefulWidget {
  const GalleryDetailScreen({super.key, required this.images, required this.selectedIndex});
  final List<String> images;
  final int selectedIndex;

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.selectedIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            child: PhotoViewGallery.builder(
              pageController: pageController,
              itemCount: widget.images.length,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(widget.images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained*6,
                );
              },
            )
        ),
      ),
    );
  }
}
