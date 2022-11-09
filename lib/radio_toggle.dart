import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class RadioToggle extends StatefulWidget {
  final List<String> titles;
  final Function(int) onToggle;
  final String? defaultSelection;
  const RadioToggle({
    Key? key,
    this.defaultSelection,
    required this.titles,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<RadioToggle> createState() => _RadioToggleState();
}

class _RadioToggleState extends State<RadioToggle> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.defaultSelection != null) {
      _selectedIndex = widget.titles.indexOf(widget.defaultSelection!);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int index = 0; index < widget.titles.length; index++) {
      var e = [
        SizedBox(
          width: 32,
          height: 32,
          child: Radio<int>(
            // fillColor: MaterialStateProperty.all(CustomColors.darkGray2),
            value: index,
            groupValue: _selectedIndex,
            onChanged: (int? value) {
              widget.onToggle(value ?? 0);
              setState(() {
                _selectedIndex = value ?? 0;
              });
            },
          ),
        ),
        Container(
          constraints: const BoxConstraints(minWidth: 80),
          child: Text(
            widget.titles[index],
            // style: const TextStyle(
            //     color: Colors.blueGrey,
            //     fontWeight: FontWeight.w400,
            //     fontFamily: "Roboto",
            //     fontStyle: FontStyle.normal,
            //     fontSize: 16.0),
          ),
        ),
      ];
      items.addAll(e);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: widget.titles
            .mapIndexed(
              (index, e) => Flexible(
                child: RadioListTile(
                  value: index,
                  title: Text(e),
                  groupValue: _selectedIndex,
                  onChanged: (int? indexSelected) {
                    widget.onToggle(indexSelected ?? 0);
                    setState(() {
                      _selectedIndex = indexSelected ?? 0;
                    });
                  },
                  isThreeLine: false,
                  dense: false,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
