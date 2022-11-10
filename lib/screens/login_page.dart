import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/component/text_input_form_field.dart';
import 'package:test_things/core/router/app_router.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/util/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              const TextInputFormField(title: 'Email'),
              verticalSpace,
              const TextInputFormField(title: 'Password'),
              verticalSpace,
              verticalSpace,
              ElevatedButton(
                onPressed: () {
                  context.go(routeDevice);
                },
                child: const Text('Login'),
              )
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextInputFormField(title: 'Email'),
                    verticalSpace,
                    const TextInputFormField(title: 'Password'),
                    verticalSpace,
                    verticalSpace,
                    ElevatedButton(
                      onPressed: () {
                        context.go(routeDevice);
                      },
                      child: const Text('Login'),
                    )
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
