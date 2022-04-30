import 'package:calistung/pages/belajar_membaca_detail_page/belajar_membaca_detail_page.dart';
import 'package:calistung/pages/kuis_detail_page/kuis_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'pages/home_page/home_page.dart';
import 'theme/theme_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Calistung",
      theme: ThemeGenerator.generate(),
      useInheritedMediaQuery: true,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 320,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(320, name: MOBILE),
          ResponsiveBreakpoint.resize(480, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
        ],
      ),
      home: const HomePage(),
    );
  }
}
