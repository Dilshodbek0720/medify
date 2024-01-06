import 'package:flutter/material.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/colors/app_colors.dart';
import 'package:medify/utils/icons/app_icons.dart';
import 'package:medify/utils/size/size_extension.dart';
import 'package:medify/utils/ui_utils/utility_function.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlobalAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: "My Favorite Doctor",
        action: [
          getIcon(AppIcons.search, context: context, onTap: (){ }),
          getIcon(AppIcons.moreCircle, context: context, onTap: (){ }),
          10.pw,
        ],
      ),
    );
  }
}
