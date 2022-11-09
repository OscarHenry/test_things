import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalLoader extends StatefulWidget {
  const HorizontalLoader({Key? key}) : super(key: key);

  static final colors = [
    Colors.red,
    Colors.indigoAccent,
    Colors.purple,
    Colors.amberAccent,
    Colors.orange,
    Colors.purple,
    Colors.cyanAccent,
    Colors.red,
    Colors.indigoAccent,
    Colors.purple,
  ];

  @override
  State<HorizontalLoader> createState() => _HorizontalLoaderState();
}

class _HorizontalLoaderState extends State<HorizontalLoader> {
  int distance = 70; // offset
  bool isActive = false;
  double progress = 0.0;

  // Base logic. you can also use this logic with ScrollController()
  bool _handleNotification(ScrollNotification notify) {
    double outRangeLoading = distance + notify.metrics.maxScrollExtent;
    double currentPixel = notify.metrics.pixels;

    if (notify.metrics.extentAfter <= 0.0) {
      if (currentPixel >= outRangeLoading) {
        networkLoader();
      }

      calculateProgress(outRangeLoading, currentPixel);
    }
    return true;
  }

  // Some math
  void calculateProgress(outRangeLoading, currentPixel) {
    double current, currentAsPrecent;

    current = outRangeLoading - currentPixel;
    currentAsPrecent = (100 * current) / distance;

    setState(() {
      progress = (100 - currentAsPrecent) * 0.01;
    });
  }

  // To simulate loading data from Network
  void networkLoader() async {
    isActive = true;
    await Future.delayed(Duration(seconds: 3));
    isActive = false;
    setState(() {
      progress = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200, bottom: 200),
        child: Stack(
          children: [
            Positioned(
              right: 15,
              top: 210,
              child: isActive
                  ? CupertinoActivityIndicator()
                  : CupertinoActivityIndicator.partiallyRevealed(
                      progress: progress,
                    ),
            ),
            NotificationListener<ScrollNotification>(
              onNotification: _handleNotification,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: HorizontalLoader.colors.length + 1,
                itemBuilder: (context, index) {
                  if (index == HorizontalLoader.colors.length) {
                    return isActive ? SizedBox(width: 50) : SizedBox();
                  }
                  return Container(
                    width: 100,
                    height: 100,
                    color: HorizontalLoader.colors[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
