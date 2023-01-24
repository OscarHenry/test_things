import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_things/component/text_input_form_field.dart';
import 'package:test_things/core/styles/app_animations.dart';
import 'package:test_things/core/styles/app_dimensions.dart';
import 'package:test_things/core/styles/custom_colors.dart';
import 'package:test_things/core/styles/fonts.dart';
import 'package:test_things/core/util/responsive.dart';
import 'package:test_things/management/chat_controller.dart';
import 'package:test_things/model/work_order.dart';
import 'package:test_things/screens/detail_page.dart';
import 'package:collection/collection.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  static const String path = '/history';
  static const String name = 'history';
  @override
  Widget build(BuildContext context) {
    final data = wOrders;
    final columns = <String>[
      'RO #',
      'Year',
      'Make',
      'Model',
      'Service Request',
      'Status',
      'WO #',
      'Date',
      'Documents',
    ];
    return Responsive(
      mobile: Scaffold(
        body: Center(
          child: Text(
            'History Page',
            style: TextStyles.header28pts,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: ValueKey(GoRouter.of(context).location),
          onPressed: () {
            context.pushNamed(DetailPage.name, extra: 'history');
          },
          tooltip: 'Details',
          child: const Text('Details'),
        ),
      ),
      tablet: _HistoryPageTablet(columns: columns, wOrder: wOrders),
    );
  }
}

class _HistoryPageTablet extends StatefulWidget {
  const _HistoryPageTablet(
      {Key? key, required this.wOrder, required this.columns})
      : super(key: key);
  final List<String> columns;
  final List<WorkOrder> wOrder;
  @override
  State<_HistoryPageTablet> createState() => _HistoryPageTabletState();
}

class _HistoryPageTabletState extends State<_HistoryPageTablet> {
  late final List<String> columns = widget.columns;
  late final List<WorkOrder> wOrder = widget.wOrder;

  List<DataCell> _buildCells(WorkOrder wo, List<String> columns) {
    return columns.mapIndexed(
      (index, e) {
        switch (index) {
          case 0:
            return DataCell(Text(wo.ro));
          case 1:
            return DataCell(Text(wo.year));
          case 2:
            return DataCell(Text(wo.make));
          case 3:
            return DataCell(Text(wo.model));
          case 4:
            return DataCell(Text(wo.serviceRequest.name));
          case 5:
            return DataCell(Text(wo.status.name));
          case 6:
            return DataCell(Text(wo.woId));
          case 7:
            return DataCell(Text(wo.date.toIso8601String()));
          case 8:
            return DataCell(
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_card_outlined),
                    label: const Text('Invoice'),
                  ),
                  horizontalSpace,
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.account_box_outlined),
                    label: const Text('Report'),
                  ),
                ],
              ),
            );
          default:
            return DataCell(Text(wo.make));
        }
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorsHelper.lightGray3,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('History'),
        centerTitle: false,
        titleTextStyle:
            TextStyles.titleBold16pts.apply(color: CustomColorsHelper.black),
        titleSpacing: 16,
        actions: [
          if (context.watch<ChatController>().isOpen)
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
          horizontalSpace,
        ],
      ),
      body: Card(
        color: CustomColorsHelper.white,
        shape: const ContinuousRectangleBorder(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: defAnimDuration,
              color: CustomColorsHelper.white,
              width: context.watch<ChatController>().isOpen ? 0 : 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Filter',
                      style: TextStyles.titleBold16pts
                          .apply(color: CustomColorsHelper.black),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                              columns.length - 1,
                              (index) => TextInputFormField(
                                title: columns[index],
                              ),
                            ),
                            const SizedBox(height: 32),
                            OutlinedButton(
                              onPressed: () {},
                              child: const Text('Reset Filter'),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    dataRowColor: MaterialStateProperty.all(
                      CustomColorsHelper.white,
                    ),
                    columns: columns
                        .map(
                          (e) => DataColumn(
                            label: Text(e),
                          ),
                        )
                        .toList(),
                    rows: wOrder
                        .mapIndexed(
                          (index, wo) => DataRow(
                            cells: _buildCells(wo, columns),
                            color: index.isEven
                                ? MaterialStateProperty.all(
                                    CustomColorsHelper.lightGray3)
                                : MaterialStateProperty.all(
                                    CustomColorsHelper.white,
                                  ),
                            selected: wo.isSelected,
                            onSelectChanged: (value) {
                              setState(() {
                                wo.isSelected = value!;
                              });
                            },
                          ),
                        )
                        .toList(),
                    border: const TableBorder(
                      horizontalInside:
                          BorderSide(color: CustomColorsHelper.lightGray3),
                    ),
                    onSelectAll: (isAllSelected) {
                      wOrder.map((e) => e.isSelected = isAllSelected!);
                      setState(() {});
                    },
                    showCheckboxColumn: true,
                    showBottomBorder: true,
                    columnSpacing: 2.5.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
