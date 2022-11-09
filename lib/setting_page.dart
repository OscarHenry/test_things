import 'package:flutter/material.dart';
import 'package:test_things/styles/app_dimensions.dart';
import 'package:test_things/text_input_form_field.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Form(
          child: Column(
            children: const [
              verticalSpace,
              TextInputFormField(
                title: 'input 1',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
              ),
              verticalSpace,
              TextInputFormField(
                title: 'input 2',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
              ),
              verticalSpace,
              TextInputFormField(
                title: 'input 3',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('btn1'),
              ),
            ),
            horizontalSpace,
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('btn2'),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting Page'),
      ),
      body: Column(
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 24,
              mainAxisSpacing: 16,
              maxCrossAxisExtent: width / 2,
              mainAxisExtent: kMinInteractiveDimension,
            ),
            children: List.generate(
              4,
              (index) => OutlinedButton(
                onPressed: () {},
                child: Text('Button$index'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
