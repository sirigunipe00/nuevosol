import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/po_approval_list/model/po_order_items.dart';
import 'package:nuevosol/features/po_approval_list/presentation/bloc/bloc_provider.dart';
import 'package:nuevosol/styles/app_color.dart';


class PoDataTableDetails extends StatelessWidget {
  const PoDataTableDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderLines, PurchaseOrderLinesState>(
      builder: (_, state) {
        final orderLines = state.maybeWhen(
          orElse: () => <PoOrderItemsForm>[],
          success: (data) => data,
        );
        return DataTable(
          headingTextStyle: const TextStyle(
            fontSize: 12,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          dataTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: AppColors.subtitlecolor,
          ),
          decoration: const BoxDecoration(color: Color(0xFFF1F1F1)),
          border: TableBorder.all(color: const Color(0xFF808080)),
          headingRowColor: WidgetStateProperty.all(AppColors.titlecolor),
          columns: const [
            DataColumn(label: Text('SI No')),
            DataColumn(label: Text('Item Name')),
            DataColumn(label: Text('Rate')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Amount')),
          ],
          columnSpacing: 30,
          headingRowHeight: 30,
          horizontalMargin: 10,
          rows: List.generate(orderLines.length, (index) {
            final siNo = (index + 1).toString();
            final item = orderLines.elementAt(index);
            return DataRow(cells: [
              DataCell(
                Center(
                  child: Text(siNo,
                    style: const TextStyle(
                      color: AppColors.titlecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              DataCell(Center(child: Text(item.itemName))),
              DataCell(Align(
                alignment: Alignment.centerRight,
                child: Text(NumUtils.inRupeesFormat(item.rate))),
              ),
              DataCell(Align(
                alignment: Alignment.centerRight,
                child: Text('${item.quantity}')),
              ),
              DataCell(Align(
                alignment: Alignment.centerRight,
                child: Text(NumUtils.inRupeesFormat(item.amount))),
              )],
            );
          }),
        );
      },
    );
  }
}
