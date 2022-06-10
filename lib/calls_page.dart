import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_things/dto.dart';

final GlobalKey<AnimatedListState> notificationListKey =
    GlobalKey<AnimatedListState>();
final GlobalKey<AnimatedListState> devicesListKey =
    GlobalKey<AnimatedListState>();

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key, required this.isHideBottomNavBar})
      : super(key: key);
  final Function(bool isHideBottomNavBar) isHideBottomNavBar;
  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  bool _handleScrollNotification(ScrollNotification notification) {
    // log(notification.toString(), name: 'HenryDebug');

    if (notification.depth == 0 &&
        (notification.metrics.axisDirection == AxisDirection.up ||
            notification.metrics.axisDirection == AxisDirection.down)) {
      if (notification is ScrollStartNotification) {
        notification.metrics.axisDirection;
        // log('ScrollStart ${notification.metrics.axisDirection}',
        //     name: 'HenryDebug');
        widget.isHideBottomNavBar(false);
      }
      if (notification is ScrollEndNotification) {
        notification.metrics.axisDirection;
        // log('ScrollEnd ${notification.metrics.axisDirection}',
        //     name: 'HenryDebug');
        widget.isHideBottomNavBar(true);
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: PersistentAppBarAnimated(),
            floating: true,
            pinned: true,
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 3));
            },
          ),
          if (notifications.isNotEmpty)
            SliverToBoxAdapter(
              child: Container(
                constraints: const BoxConstraints.tightFor(height: 100),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 3));
                  },
                  child: AnimatedList(
                    key: notificationListKey,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    initialItemCount: notifications.length,
                    itemBuilder: notificationItemBuilder,
                  ),
                ),
              ),
            ),
          SliverAnimatedList(
            initialItemCount: devices.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              final device = devices[index];
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: const Offset(0, 0),
                ).animate(animation),
                child: Container(
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
                        child: Icon(device.isConnected
                            ? Icons.bluetooth_connected
                            : Icons.bluetooth_disabled),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vin: ${device.vin}'),
                          const Spacer(),
                          Text('Year: ${device.year}'),
                          Text('Make: ${device.make}'),
                          Text('Model: ${device.model}'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget notificationItemBuilder(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    final notification = notifications[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Container(
        width: MediaQuery.of(context).size.width * 2 / 3,
        margin: const EdgeInsetsDirectional.all(8.0),
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[1],
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.subtitle),
          trailing: CloseButton(
            color: Colors.black,
            onPressed: () {
              notificationListKey.currentState?.removeItem(
                index,
                (context, animation) => const SizedBox.shrink(),
              );
              notifications.removeAt(index);
            },
          ),
        ),
      ),
    );
  }

  Widget optionsItemBuilder(BuildContext context, int index) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .15,
        maxWidth: MediaQuery.of(context).size.width * .5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[1],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text('data$index'),
      ),
    );
  }
}

class PersistentAppBarAnimated extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const double defPadding = 8.0;
    final heightContainer =
        (maxExtent - kToolbarHeight) * 2 / 5 - (defPadding * 2);
    final widthContainer =
        MediaQuery.of(context).size.width * .5 - (defPadding * 2);
    final crossAxisCount = MediaQuery.of(context).size.width / 4;
    var _shrinkOffset = shrinkOffset.clamp(0, this.maxExtent);

    var calc = _shrinkOffset / this.maxExtent;

    final double scale = MediaQuery.of(context).size.width / 4;

    log('shrinkOffset: ${_shrinkOffset / this.maxExtent}', name: 'HenryDebug');

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: defPadding),
      child: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const Spacer(),
            Wrap(
              spacing: defPadding,
              runSpacing: defPadding,
              children: List.generate(
                4,
                (index) => InkWell(
                  onTap: () {},
                  enableFeedback: true,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 10),
                    height: calc != 0 ? 48 : 75,
                    width: calc != 0
                        ? MediaQuery.of(context).size.width / 4 - defPadding
                        : widthContainer,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('data$index'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight * 5;

  @override
  double get minExtent => kToolbarHeight * 3;

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
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      title: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
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
            icon: const Icon(Icons.notifications_active_outlined)),
      ],
    );
  }
}
