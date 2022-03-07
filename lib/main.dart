import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_case/view/content_page.dart';
import 'package:flutter_getx_case/view/my_detail_page.dart';
import 'package:flutter_getx_case/view/my_home_page.dart';
import 'package:flutter_getx_case/view/recent_contest_page.dart';
import 'package:get/get.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyHomePage(),
          transition: Transition.upToDown,
          transitionDuration: const Duration(seconds: 1),
          curve: Curves.elasticInOut,
        ),
        GetPage(
          name: '/content',
          page: () => const ContentPage(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
          curve: Curves.elasticInOut,
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailPage(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
          curve: Curves.elasticIn,
        ),
        GetPage(
          name: '/recent_contest',
          page: () => const RecentContestPage(),
          transition: Transition.downToUp,
          transitionDuration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
      ],
    );
  }
}
