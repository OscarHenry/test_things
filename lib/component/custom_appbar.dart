import 'package:flutter/material.dart';
import 'package:test_things/model/models.dart';
import 'package:test_things/component/option_item.dart';

class PersistentAppBarAnimated extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const double defPadding = 8.0;
    double minHeightContainer = kToolbarHeight - defPadding;
    double maxHeightContainer = minExtent / 2;
    final double minWidthContainer =
        (MediaQuery.of(context).size.width / 4) - defPadding;
    final double maxWidthContainer =
        (MediaQuery.of(context).size.width / 2) - defPadding;
    double scale = (shrinkOffset - maxExtent).abs();
    var scalePercent = scale / maxExtent;
    print('scalePercent: $scalePercent');
    print('scale: $scale');
    print('maxWidthContainer: $maxWidthContainer');
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Wrap(
              alignment: WrapAlignment.start,
              clipBehavior: Clip.hardEdge,
              spacing: defPadding,
              runSpacing: defPadding,
              children: [
                OptionItem(
                  title: 'Available',
                  amount: 1,
                  iconData: Icons.access_time_sharp,
                  minHeight: minHeightContainer,
                  minWidth: minWidthContainer,
                  maxHeight: maxHeightContainer,
                  maxWidth: maxWidthContainer,
                  scale: scalePercent,
                ),
                OptionItem(
                  title: 'Connected',
                  amount: 1,
                  iconData: Icons.access_time_sharp,
                  minHeight: minHeightContainer,
                  minWidth: minWidthContainer,
                  maxHeight: maxHeightContainer,
                  maxWidth: maxWidthContainer,
                  scale: scalePercent,
                ),
                OptionItem(
                  title: 'In Use',
                  amount: 2,
                  iconData: Icons.access_time_sharp,
                  minHeight: minHeightContainer,
                  minWidth: minWidthContainer,
                  maxHeight: maxHeightContainer,
                  maxWidth: maxWidthContainer,
                  scale: scalePercent,
                ),
                OptionItem(
                  title: 'Disconnected',
                  amount: 0,
                  iconData: Icons.access_time_sharp,
                  minHeight: minHeightContainer,
                  minWidth: minWidthContainer,
                  maxHeight: maxHeightContainer,
                  maxWidth: maxWidthContainer,
                  scale: scalePercent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 4.9;

  @override
  double get minExtent => kToolbarHeight * 2.8;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late Organization _selectedOrganization = organizations.first;

  void onChangedOrganization(newOrganization) {
    setState(() => _selectedOrganization = newOrganization);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: kToolbarHeight,
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      title: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: false,
          value: _selectedOrganization,
          iconEnabledColor: Colors.white,
          selectedItemBuilder: (context) {
            return organizations
                .map(
                  (org) => Center(
                    child: Text(
                      org.name,
                      style: org == _selectedOrganization
                          ? Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: Colors.white)
                          : null,
                    ),
                  ),
                )
                .toList();
          },
          items: organizations
              .map<DropdownMenuItem>(
                (org) => DropdownMenuItem<Organization>(
                  value: org,
                  child: Text(
                    org.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.black),
                  ),
                ),
              )
              .toList(),
          onChanged: onChangedOrganization,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_active_outlined),
        ),
      ],
    );
  }
}
