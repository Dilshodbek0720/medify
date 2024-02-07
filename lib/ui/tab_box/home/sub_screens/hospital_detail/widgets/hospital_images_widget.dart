import 'package:flutter/material.dart';
import 'package:medify/ui/tab_box/home/sub_screens/hospital_detail/widgets/page_images_index.dart';
import 'package:medify/utils/size/screen_size.dart';

class HospitalImagesWidget extends StatefulWidget {
  const HospitalImagesWidget({super.key, required this.image, required this.imageHeight});
  final String image;
  final double imageHeight;

  @override
  State<HospitalImagesWidget> createState() => _HospitalImagesWidgetState();
}

class _HospitalImagesWidgetState extends State<HospitalImagesWidget> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * widget.imageHeight / figmaHeight,
      width: width,
      child: Stack(
        children: [
          PageView(
              onPageChanged: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              controller: pageController,
              physics: const ScrollPhysics(),
              children: [
                SizedBox(
                  height: height * 460 / figmaHeight,
                  width: width,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: height * 460 / figmaHeight,
                  width: width,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: height * 460 / figmaHeight,
                  width: width,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                )
              ]),
          Positioned(
              bottom: 10,
              child: PageImagesIndex(activePageIndex: pageIndex))
        ],
      ),
    );
  }
}
