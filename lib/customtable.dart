import 'package:customwidget/table_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

// DataTable
// ScrollController
// Row
// Column

class _CustomTableState extends State<CustomTable> {

  // ScrollGroupController,
  // To Scroll the multiple scroll-view in sync using controller
  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();

  ScrollController? headerScrollController;
  ScrollController? dataScrollController;

  @override
  void initState() {
    super.initState();
    headerScrollController = controllerGroup.addAndGet();
    dataScrollController = controllerGroup.addAndGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            tableContent(),
            tableHeader(),
          ],
        ),
      ),
    );
  }

  Widget tableContent() {
    return SingleChildScrollView(
      child: Row(
        children: [
          DataTable(
            columns: TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
              return DataColumn(
                label: SizedBox(
                  child: Text(e.title ?? ''),
                  width: e.width ?? 0,
                ),
              );
            }).toList(),
            rows: List.generate(100, (index) {
              return DataRow(cells: [
                DataCell(
                  SizedBox(
                    child: Text('$index: F-Apple'),
                    width: TableDataHelper.kTableColumnsList.first.width,
                  ),
                )
              ]);
            }),
            headingRowColor: MaterialStateProperty.all(Colors.green),
            dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
          ), // start
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: dataScrollController,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.blue),
                dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
                columns: TableDataHelper.kTableColumnsList
                    .getRange(1, TableDataHelper.kTableColumnsList.length - 1)
                    .map((e) {
                  return DataColumn(
                    label: SizedBox(
                      child: Text(e.title ?? ''),
                      width: e.width ?? 0,
                    ),
                  );
                }).toList(),
                rows: List.generate(100, (index) {
                  return DataRow(cells: [
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[1].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[2].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[3].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[4].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[5].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[6].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[7].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[8].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[9].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[10].width,
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        child: Text('$index: M-Apple'),
                        width: TableDataHelper.kTableColumnsList[11].width,
                      ),
                    ),
                  ]);
                }),
              ),
            ),
          ),
          DataTable(
            columns: TableDataHelper.kTableColumnsList
                .getRange(TableDataHelper.kTableColumnsList.length - 1, TableDataHelper.kTableColumnsList.length)
                .map((e) {
              return DataColumn(
                label: SizedBox(
                  child: Text(e.title ?? ''),
                  width: e.width ?? 0,
                ),
              );
            }).toList(),
            headingRowColor: MaterialStateProperty.all(Colors.orange),
            dataRowColor: MaterialStateProperty.all(Colors.orange.shade100),
            rows: List.generate(100, (index) {
              return DataRow(cells: [
                DataCell(
                  SizedBox(
                    child: Text('$index: L-Apple'),
                    width: TableDataHelper.kTableColumnsList.last.width,
                  ),
                )
              ]);
            }),
          ), // end
        ],
      ),
    );
  }

  Widget tableHeader() {
    return Row(
      children: [
        DataTable(
          columns: TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
            return DataColumn(
              label: SizedBox(
                child: Text(e.title ?? ''),
                width: e.width ?? 0,
              ),
            );
          }).toList(),
          rows: const [],
          headingRowColor: MaterialStateProperty.all(Colors.green),
          dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
        ), // start
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: headerScrollController,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.blue),
              dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
              columns:
                  TableDataHelper.kTableColumnsList.getRange(1, TableDataHelper.kTableColumnsList.length - 1).map((e) {
                return DataColumn(
                  label: SizedBox(
                    child: Text(e.title ?? ''),
                    width: e.width ?? 0,
                  ),
                );
              }).toList(),
              rows: const [],
            ),
          ),
        ),
        DataTable(
          columns: TableDataHelper.kTableColumnsList
              .getRange(TableDataHelper.kTableColumnsList.length - 1, TableDataHelper.kTableColumnsList.length)
              .map((e) {
            return DataColumn(
              label: SizedBox(
                child: Text(e.title ?? ''),
                width: e.width ?? 0,
              ),
            );
          }).toList(),
          headingRowColor: MaterialStateProperty.all(Colors.orange),
          dataRowColor: MaterialStateProperty.all(Colors.orange.shade100),
          rows: const [],
        ), // end
      ],
    );
  }
}
