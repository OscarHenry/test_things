import 'dart:async';
import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/screens/home.dart';
import 'package:test_things/screens/setting_page.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription _sub;

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
            builder: (context) => const Home(),
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
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // initUniLinks();
    return MaterialApp.router(
      title: 'Flutter Demo',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      useInheritedMediaQuery: true,
      routerConfig: router,
    );
  }
}
