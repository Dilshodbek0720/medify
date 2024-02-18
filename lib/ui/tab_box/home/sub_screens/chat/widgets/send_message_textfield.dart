import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medify/data/models/icon/icon_type.dart';
import 'package:medify/ui/tab_box/home/sub_screens/chat/widgets/for_audio/audio.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({
    super.key,
    required this.onSuffixIconTap,
    required this.onFileIconTap,
    required this.onChanged,
    required this.onSendTap,
    required this.controller,
    required this.value,
  });
  final VoidCallback onSuffixIconTap;
  final VoidCallback onFileIconTap;
  final ValueChanged onChanged;
  final VoidCallback onSendTap;
  final TextEditingController controller;
  final String value;

  @override
  State<SendMessageTextField> createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {

  FocusNode? focusNode = FocusNode();

  double _height = 56.0;

  @override
  void initState() {
    super.initState();
    focusNode?.addListener(_onFocusChange);
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  void _onTextChanged() {
    setState(() {
      _height = 56.0 + (widget.controller.text.length / 100) * 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // onTap: widget.onSuffixIconTap,
            child: SvgPicture.asset(
              AppIcons.smile,
              width: 24.w,
              colorFilter: const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn),
            ),
          ),
          SizedBox(
            width: 255.w,
            height: _height,
            child: TextField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: null,
              expands: true,
              // focusNode: focusNode,
              onChanged: widget.onChanged,
              controller: widget.controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontFamily: "Urbanist",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9e9e9e),
                  height: 20 / 14,
                ),
                contentPadding: EdgeInsets.all(15.r),
                hintText: 'Message...',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onSuffixIconTap,
            child: SvgPicture.asset(
              AppIcons.paperClip,
              width: 24.w,
              colorFilter: const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn),
            ),
          ),
          10.pw,
          GestureDetector(
            onTap: widget.onFileIconTap,
            child: SvgPicture.asset(
              AppIcons.paper,
              width: 24.w,
              colorFilter: const ColorFilter.mode(AppColors.c_500, BlendMode.srcIn),
            ),
          ),
          10.pw,
          widget.value.isEmpty
              ? const AudioController()
              : InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: widget.onSendTap,
                  child: SvgPicture.asset(
                    AppIcons.getSvg(name: AppIcons.send, iconType: IconType.bold),
                    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                  ),
                ),
        ],
      ),
    );
  }
}
