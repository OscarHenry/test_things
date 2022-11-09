import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_things/model/dto.dart';
import 'package:test_things/screens/notification_page.dart';
import 'package:test_things/component/notification_widget.dart';
import '../component/device_item.dart';

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
  late Organization _selectedOrganization = organizations.first;
  void onChangedOrganization(newOrganization) {
    setState(() => _selectedOrganization = newOrganization);
  }

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
          // SliverPersistentHeader(
          //   delegate: PersistentAppBarAnimated(),
          //   floating: true,
          //   pinned: true,
          // ),
          SliverAppBar(
            backgroundColor: Colors.black87,
            leading:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            title: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                alignment: Alignment.center,
                value: _selectedOrganization,
                iconEnabledColor: Colors.white,
                iconSize: 0,
                selectedItemBuilder: (context) {
                  return organizations
                      .map(
                        (org) => Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  org.name,
                                  style: org == _selectedOrganization
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .apply(color: Colors.white)
                                      : null,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down)
                            ],
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationPage()),
                  );
                },
                icon: const Icon(Icons.notifications_active_outlined),
              ),
            ],
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
                child: const NotificationsWidget(),
              ),
            ),
          SliverAnimatedList(
            initialItemCount: devices.length,
            itemBuilder: devicesItemBuilder,
          ),
        ],
      ),
    );
  }

  Widget devicesItemBuilder(
      BuildContext context, int index, Animation<double> animation) {
    final device = devices[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(animation),
      child: DeviceItem(device: device),
    );
  }
}
