import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/styles/fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text(
          GoRouter.of(context).location,
          style: TextStyles.header28pts,
        ),
      ),
    );
  }
}
