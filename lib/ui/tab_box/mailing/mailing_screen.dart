import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/mailing/widgets/drawer_widget.dart';
import 'package:medify/ui/tab_box/mailing/widgets/mailing_appbar.dart';
import 'package:medify/ui/tab_box/mailing/widgets/mailing_card.dart';
import 'package:medify/utils/icons/app_icons.dart';

class MailingScreen extends StatefulWidget {
  const MailingScreen({super.key});

  @override
  State<MailingScreen> createState() => _MailingScreenState();
}

class _MailingScreenState extends State<MailingScreen> {
  int screenIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            key: _scaffoldKey,
            drawer: DrawerWidget(cancelOnTap: (){
              _closeDrawer();
            }, onChanged: (int value) {
              if(value==11){

              }else{
                setState(() {
                  screenIndex = value;
                });
              }
              Navigator.pop(context);
            }, selectedIndex: screenIndex,),
            appBar: MailingAppbar(
              onTapOpen: (){
                _openDrawer();
              },
            ),
            body: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return MailingCard(image: AppIcons.drWatson, title: 'Dribbble',jobName: 'UI/UX Design Job',description: 'UI/UX Designer and other roles are available', onTapStar: () {  }, onTap: () {
                  Navigator.pushNamed(context, RouteNames.mailDetailScreen);
                },);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w,),
                  child: const Divider(height: 1),
                );
              },
              itemCount: 7,
            )
        ),
      ),
    );
  }
}
