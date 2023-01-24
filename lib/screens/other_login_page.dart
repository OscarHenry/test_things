import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_things/component/text_input_form_field.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/graphql/__generated/login.graphql.dart';
import 'package:test_things/graphql/__generated/seed.graphql.dart';
import 'package:test_things/main.dart';
import 'package:test_things/screens/about_us_page.dart';
import 'package:test_things/screens/device_page.dart';
import 'package:test_things/screens/policy_privacy_page.dart';

class OtherLoginPage extends StatelessWidget {
  const OtherLoginPage({Key? key}) : super(key: key);
  static const String path = '/other-login';
  static const String name = 'other-login';

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _LoginMobile(),
      tablet: _LoginTabet(),
    );
  }
}

class _LoginMobile extends HookWidget {
  const _LoginMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  'assets/images/logo_astech_connect_dark.svg',
                ),
              ),
              const TextInputFormField(title: 'Email'),
              verticalSpace,
              const TextInputFormField(title: 'Password'),
              verticalSpace,
              verticalSpace,
              ElevatedButton(
                onPressed: () async {
                  await login(context);
                  // context.goNamed(DevicePage.name);
                },
                child: const Text('Login'),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      context.pushNamed(PolicyPrivacyPage.name);
                    },
                    child: const Text('Policy Privacy'),
                  ),
                  horizontalSpace,
                  TextButton(
                    onPressed: () {
                      context.pushNamed(AboutUsPage.name);
                    },
                    child: const Text('About Us'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    final client = getIt.get<AppClient>().client.value;
    final mutationOption = MutationOptions(
      document: gql('''mutation {
  login(input: { email: "zascontab@gmail.com", password: "vamosatest" }) {
    token
  }
}'''),
    );

    try {
      final response = await client.mutate(mutationOption);
      log('${response.data}', name: 'Error');
      log('${response.exception}', name: 'Error');

      await showDialog(
        context: context,
        builder: (dContext) => SimpleDialog(
          title: const Text('Response'),
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Align(
                alignment: Alignment.center,
                child: Text('${response.data}'),
              ),
            ),
          ],
        ),
      );
    } catch (e, s) {
      log('$e\n$s', name: 'Error');
    }
  }
}

class _LoginTabet extends StatelessWidget {
  const _LoginTabet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login_tablet_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: FormBuilder(
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SvgPicture.asset(
                        'assets/images/logo_astech_connect_dark.svg',
                      ),
                    ),
                    const TextInputFormField(title: 'Email'),
                    verticalSpace,
                    const TextInputFormField(title: 'Password'),
                    verticalSpace,
                    verticalSpace,
                    ElevatedButton(
                      onPressed: () async {
                        await login(context).then(
                          (token) async {
                            if (token != null) {
                              showDialog(
                                context: context,
                                builder: (dContext) => SimpleDialog(
                                  title: const Text('Response'),
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(token),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              context.goNamed(DevicePage.name);
                            }
                          },
                        );
                      },
                      child: const Text('Login'),
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              context.pushNamed(PolicyPrivacyPage.name);
                            },
                            child: const Text('Policy Privacy'),
                          ),
                        ),
                        horizontalSpace,
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              context.pushNamed(AboutUsPage.name);
                            },
                            child: const Text('About Us'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> login(BuildContext context) async {
    final client = getIt.get<AppClient>().client.value;
    final mutationOption = MutationOptions(
      document: gql('''mutation {
  login(input: { email: "zascontab@gmail.com", password: "vamosatest" }) {
    token
  }
}'''),
    );

    try {
      final response = await client.mutate(mutationOption);
      log('${response.data}', name: 'Error');
      log('${response.exception}', name: 'Error');

      var login = response.data?['login'];
      return login?['token'];
    } catch (e, s) {
      log('$e\n$s', name: 'Error');
      return null;
    }
  }
}
