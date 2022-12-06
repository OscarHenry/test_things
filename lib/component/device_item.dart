import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_things/model/models.dart';

class DeviceItem extends StatefulWidget {
  const DeviceItem({
    Key? key,
    required this.device,
  }) : super(key: key);

  final Device device;

  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {
  late double widthAnim = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(const Size.fromHeight(120)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: kElevationToShadow[1],
          color: Colors.white),
      margin: const EdgeInsetsDirectional.all(8.0),
      padding: const EdgeInsetsDirectional.all(12.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(widget.device.isConnected
                ? Icons.bluetooth_connected
                : Icons.bluetooth_disabled),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vin: ${widget.device.vin}'),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: 16,
                width: widthAnim,
                color: Colors.pinkAccent,
                child: Text('$widthAnim'),
              ),
              Text('Year: ${widget.device.year}'),
              Text('Make: ${widget.device.make}'),
              Text('Model: ${widget.device.model}'),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widthAnim = Random.secure().nextInt(300).toDouble();
              });
            },
            child: const Text('anim'),
          ),
        ],
      ),
    );
  }
}
