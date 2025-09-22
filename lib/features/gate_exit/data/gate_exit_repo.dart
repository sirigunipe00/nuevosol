import 'package:nuevosol/core/core.dart';
import 'package:nuevosol/features/gate_exit/model/gate_exit.dart';
import 'package:nuevosol/features/gate_exit/model/sales_invoice_form.dart';


abstract interface class GateExitRepo {
 AsyncValueOf<List<GateExit>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
 );
  AsyncValueOf<Pair<String, String>> createGateExit(GateExit form);
  // AsyncValueOf<Pair<String, String>>submitGateExit(NewGateExitForm form);
    AsyncValueOf<List<SalesInvoiceForm>> fetchSalesInvoice(String name);

}