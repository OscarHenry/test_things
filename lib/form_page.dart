import 'package:flutter/material.dart';
import 'package:test_things/text_input_form_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late final TextEditingController _odometerController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextInputFormField(
                  title: 'odometer*',
                  hintText: 'Odometer',
                  keyboardType: TextInputType.number,
                  inputAction: TextInputAction.done,
                  controller: _odometerController,
                  hasError: false,
                  length: 7,
                ),
                TextFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
