import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_things/app.dart';

void main() async {
  await setup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

final getIt = GetIt.I;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  getIt.registerFactory<AppClient>(
    () => AppClient('http://5.189.139.14:8083/graphql'),
  );
}

class AppClient {
  AppClient(this.baseUrl) {
    initializeClient();
  }
  final String baseUrl;

  late ValueNotifier<GraphQLClient> client;

  void initializeClient() {
    final HttpLink httpLink = HttpLink(baseUrl);

    // final AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    //   // OR
    //   // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    // );
    //
    // final Link link = authLink.concat(httpLink);

    client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
  }
}
