import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/component/text_input_form_field.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/screens/about_us_page.dart';
import 'package:test_things/screens/device_page.dart';
import 'package:test_things/screens/policy_privacy_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String path = '/login';
  static const String name = 'login';

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _LoginMobile(),
      tablet: _LoginTabet(),
    );
  }
}

class _LoginMobile extends StatelessWidget {
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
                onPressed: () {
                  context.goNamed(DevicePage.name);
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
                      onPressed: () {
                        context.goNamed(DevicePage.name);
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
}
