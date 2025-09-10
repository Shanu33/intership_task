import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum HeaderIconState { none, one, two }

class OrdersTable extends StatelessWidget {
  const OrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final headers = [
      HeaderConfig(
        text: "Time",
        iconState: HeaderIconState.two,
        svgPaths: ["assets/images/up-down-arrow.svg", "assets/images/filter.svg"],
        columnSize: ColumnSize.S,
      ),
      HeaderConfig(
        text: "Client",
        iconState: HeaderIconState.one,
        svgPaths: ["assets/images/up-down-arrow.svg"],
        columnSize: ColumnSize.M,
      ),
      HeaderConfig(text: "Ticker", iconState: HeaderIconState.none, columnSize: ColumnSize.L),
      HeaderConfig(
        text: "Side",
        iconState: HeaderIconState.one,
        svgPaths: ["assets/images/filter.svg"],
        columnSize: ColumnSize.S,
      ),
      HeaderConfig(
        text: "Product",
        iconState: HeaderIconState.two,
        svgPaths: ["assets/images/up-down-arrow.svg", "assets/images/filter.svg"],
        columnSize: ColumnSize.M,
      ),
      HeaderConfig(
        text: "Qty (Executed/Total)",
        iconState: HeaderIconState.one,
        svgPaths: ["assets/images/filter.svg"],
        columnSize: ColumnSize.M,
      ),
      HeaderConfig(
        text: "Price",
        iconState: HeaderIconState.one,
        svgPaths: ["assets/images/filter.svg"],
        columnSize: ColumnSize.S,
      ),
      HeaderConfig(text: "Actions", iconState: HeaderIconState.none, columnSize: ColumnSize.S),
    ];

    return DataTable2(
      columnSpacing: 12,
      horizontalMargin: 12,
      minWidth: 800,
      fixedLeftColumns: 1,
      headingRowColor: MaterialStateProperty.all(const Color(0xFFF1F3F4)),
      border: TableBorder.all(color: const Color(0xFFE0E0E0), width: 1),
      columns: headers
          .map(
            (header) => DataColumn2(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(header.text)),
              const SizedBox(width: 4),
              if (header.iconState == HeaderIconState.one && header.svgPaths.isNotEmpty)
                SvgPicture.asset(header.svgPaths[0], width: 16, height: 16),
              if (header.iconState == HeaderIconState.two && header.svgPaths.length >= 2) ...[
                SvgPicture.asset(header.svgPaths[0], width: 16, height: 16),
                const SizedBox(width: 2),
                SvgPicture.asset(header.svgPaths[1], width: 16, height: 16),
              ],
            ],
          ),
          size: header.columnSize,
        ),
      )
          .toList(),
      rows: const [
        DataRow(cells: [
          DataCell(Text("08:14:31")),
          DataCell(Text("AAA001")),
          DataCell(Text("RELIANCE")),
          DataCell(Text("Buy")),
          DataCell(Text("CNC")),
          DataCell(Text("50/100")),
          DataCell(Text("250.50")),
          DataCell(Icon(Icons.more_vert)),
        ]),
        DataRow(cells: [
          DataCell(Text("08:14:31")),
          DataCell(Text("AAA003")),
          DataCell(Text("MRF")),
          DataCell(Text("Buy")),
          DataCell(Text("NRML")),
          DataCell(Text("10/20")),
          DataCell(Text("2,700.00")),
          DataCell(Icon(Icons.more_vert)),
        ]),
        DataRow(cells: [
          DataCell(Text("08:14:31")),
          DataCell(Text("AAA002")),
          DataCell(Text("ASIANPAINT")),
          DataCell(Text("Buy")),
          DataCell(Text("NRML")),
          DataCell(Text("10/30")),
          DataCell(Text("1,500.60")),
          DataCell(Icon(Icons.more_vert)),
        ]),
        DataRow(cells: [
          DataCell(Text("08:14:31")),
          DataCell(Text("AAA002")),
          DataCell(Text("TATAINVEST")),
          DataCell(Text("Sell")),
          DataCell(Text("INTRADAY")),
          DataCell(Text("10/10")),
          DataCell(Text("2,300.10")),
          DataCell(Icon(Icons.more_vert)),
        ]),
      ],
    );
  }
}

// Header configuration class
class HeaderConfig {
  final String text;
  final HeaderIconState iconState;
  final List<String> svgPaths;
  final ColumnSize columnSize;

  HeaderConfig({
    required this.text,
    this.iconState = HeaderIconState.none,
    this.svgPaths = const [],
    this.columnSize = ColumnSize.M,
  });
}
