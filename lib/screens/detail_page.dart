import 'package:flutter/material.dart';
import 'package:test_things/core/styles/fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.title}) : super(key: key);
  static const String path = '/detail';
  static const String name = 'detail';
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text(
          'DetailPage from $title',
          style: TextStyles.header28pts,
        ),
      ),
    );
  }
}
