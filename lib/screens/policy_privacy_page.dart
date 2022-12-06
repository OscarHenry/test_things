import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_things/core/styles/fonts.dart';

class PolicyPrivacyPage extends StatelessWidget {
  const PolicyPrivacyPage({Key? key}) : super(key: key);
  static const String path = '/policy-privacy';
  static const String name = 'policy-privacy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy Privacy'),
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
