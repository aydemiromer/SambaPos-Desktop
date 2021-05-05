import 'package:flutter/material.dart';
import 'package:sambapos_desktop/constant/constants.dart';
import 'package:sambapos_desktop/view/view.dart';
import 'package:easy_localization/easy_localization.dart';

void main() => runApp(
      EasyLocalization(
        child: MyApp(),
        supportedLocales: AppConstant.SUPPORTED_LOCALE,
        path: AppConstant.LANG_PATH,
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: FirstPageUi(),
    );
  }
}
