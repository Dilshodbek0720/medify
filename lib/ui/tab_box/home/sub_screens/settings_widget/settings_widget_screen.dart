import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medify/cubits/settings_widget/settings_widget_cubit.dart';
import 'package:medify/ui/tab_box/home/sub_screens/settings_widget/widgets/setting_widget_card.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/size/size_extension.dart';

class SettingsWidgetScreen extends StatefulWidget {
  const SettingsWidgetScreen({super.key});

  @override
  State<SettingsWidgetScreen> createState() => _SettingsWidgetScreenState();
}

class _SettingsWidgetScreenState extends State<SettingsWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: "Настройки виджетов",
      ),
      body: BlocBuilder<SettingsWidgetCubit, SettingsWidgetState>(
        builder: (context, state) {
          List<String> activeNames = [];
          List<int> activeValues = [];
          List<String> passiveNames = [];
          List<int> passiveValues = [];
          for(int i = 0; i < state.settingsNames.length; i++){
            if(state.settingsValues[i]){
              activeNames.add(state.settingsNames[i]);
              activeValues.add(i);
            }else{
              passiveNames.add(state.settingsNames[i]);
              passiveValues.add(i);
            }
          }
          return ListView(
            children: [
              16.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text("Доступные", style: TextStyle(
                    fontSize: 20.sp, fontWeight: FontWeight.w700),),
              ),
              16.ph,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(passiveNames.length, (index) => SettingWidgetCard(
                      title: passiveNames[index], onTap: () {
                    context
                        .read<SettingsWidgetCubit>()
                        .updateSettingsWidgetValues(
                        passiveNames[index],
                        !state.settingsValues[passiveValues[index]],
                        state.settingsNames);
                    passiveNames.removeAt(index);
                    passiveValues.removeAt(index);
                  }, isSelected: false),)
                ],
              ),
              16.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text("Активные", style: TextStyle(
                    fontSize: 20.sp, fontWeight: FontWeight.w700),),
              ),
              16.ph,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(activeNames.length, (index) => SettingWidgetCard(
                      title: activeNames[index], onTap: () {
                    context
                        .read<SettingsWidgetCubit>()
                        .updateSettingsWidgetValues(
                        activeNames[index],
                        !state.settingsValues[activeValues[index]],
                        state.settingsNames);
                    activeNames.removeAt(index);
                    activeValues.removeAt(index);
                  }, isSelected: true),)
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
