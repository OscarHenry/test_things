import 'dart:async';
import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_theme.dart';
import 'package:test_things/core/styles/custom_colors.dart';
import 'package:test_things/management/chat_controller.dart';
import 'package:test_things/screens/login_page.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:uni_links/uni_links.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    // ... check initialLink
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final initialLink = await getInitialLink();
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
      log('$initialLink', name: 'init UniLinks');
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
      log('PlatFormException', name: 'listen UniLinks');
    }

    // Attach a listener to the stream
    _sub = linkStream.listen((String? link) {
      // Parse the link and warn the user, if it is not correct
      log('$link', name: 'listen UniLinks');
      final linkSplitted = link?.split('/');
      log('${linkSplitted?.last}', name: 'listen UniLinks');
      if (linkSplitted?.last == 'home') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
      if (linkSplitted?.last == 'settings') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingPage(),
          ),
        );
      }
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
      log('$err', name: 'listen UniLinks');
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // initUniLinks();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatController()),
      ],
      child: MaterialApp.router(
        title: 'Test Things App',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        themeMode: ThemeMode.system,
        color: CustomColorsHelper.primaryBlue,
        theme: ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch:
                convertToMaterialColor(CustomColorsHelper.primaryBlue),
          ),
        ),
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: const ColorScheme.dark().copyWith(
            primary: convertToMaterialColor(CustomColorsHelper.primaryBlue),
          ),
        ),
        useInheritedMediaQuery: true,
        routerConfig: router,
      ),
    );
  }
}
