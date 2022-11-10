import 'package:flutter/material.dart';
import 'package:test_things/core/util/responsive.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.builder(
      builder: (context, constrains, orientation) => Stack(
        alignment: Alignment.center,
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Text(
                constrains.toString(),
                style: TextStyle(fontSize: 4.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
