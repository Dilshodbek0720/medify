import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medify/data/local/storage_repository/storage_repository.dart';
import 'package:medify/ui/app_routes.dart';
import 'package:medify/ui/tab_box/profile/sub_screens/language/widgets/language_selector.dart';
import 'package:medify/ui/widgets/global_appbar.dart';
import 'package:medify/utils/constants/storage_keys.dart';
import 'package:medify/utils/size/size_extension.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = StorageRepository.getInt(StorageKeys.languageKey);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GlobalAppBar(
        title: tr('language'),
        onTap: () {
          Navigator.pushNamed(context,RouteNames.tabBox);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.ph,
          LanguageSelector(
            onTap: () {
              changeLanguage("uz");
            },
            isSelected: selectedIndex == 0,
            title: "O'zbek",
          ),
          LanguageSelector(
            onTap: () {
              changeLanguage("cyrl");
            },
            isSelected: selectedIndex == 1,
            title: "Кирилл-Лотин",
          ),
          LanguageSelector(
            onTap: () {
              changeLanguage("ru");
            },
            isSelected: selectedIndex == 2,
            title: "Русский",
          ),
          LanguageSelector(
            onTap: () {
              changeLanguage("en");
            },
            isSelected: selectedIndex == 3,
            title: "English",
          ),
        ],
      ),
    );
  }

  changeLanguage(String langCode) {
    if (langCode == "uz") {
      selectedIndex = 0;
      context.setLocale(const Locale('uz', 'UZ'));
    } else if (langCode == "cyrl") {
      selectedIndex = 1;
      context.setLocale(const Locale('uz', 'Cyrl'));
    } else if(langCode == "ru"){
      selectedIndex = 2;
      context.setLocale(const Locale('ru', 'RU'));
    }else{
      selectedIndex = 3;
      context.setLocale(const Locale('en', 'US'));
    }
    StorageRepository.putInt(StorageKeys.languageKey, selectedIndex);
    setState(() {});
  }
}
