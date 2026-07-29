import 'package:nuevosol/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {

  factory Urls.nuevosolUat() => const Urls('https://nuevosoluat.easycloud.co.in/api');
  factory Urls.local() => const Urls('http://192.168.1.104:8000/api');
    factory Urls.live() => const Urls('https://livenuevosol.easycloud.co.in/api');


  const Urls(this.url);
static String filepath(String path) {
    return '${baseUrl.replaceAll('api', '')}/${path.replaceAll('/private', '').replaceAll("///", '/')}';
  }

  final String url;

  static bool get isTest => Uri.parse(
    _reqisteredUrl.url,
  ).authority.split('.').first.toLowerCase().contains('uat');
  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';

  static final login = '$cusWs/login';
  static final getList = '$cusWs/frappe.client.get_list';
  static final getUsers = '$cusWs/nuevosol.gate_api.getUsers';

  static final appVersion = '$cusWs/easy_common.api.get_app_version';

  // static final companyName = '$jsonWs/Company';
  static final createEmployee = '$cusWs/nuevosol.gatepass_api.create_employee_gate_pass';
  static final rejectGatePass = '$cusWs/nuevosol.gatepass_api.reject_employee_gate_pass';
  static final approveGatePass = '$cusWs/nuevosol.gatepass_api.approve_employee_gate_pass';
  static final qrData = '$cusWs/nuevosol.gatepass_api.scan_gate_pass_qr';
  static final createGateEntry = '$cusWs/nuevosol.gate_api.createGateEntry';
  static final createGateExit = '$cusWs/nuevosol.gate_api.createGateExit';
   static final addEmployeeToTrainingEvent =
      '$cusWs/nuevosol.api.add_employee_to_training_event';

  static final getPurchaseOrders = '$cusWs/nuevosol.api.get_purchase_orders';
  static final getPoOrderItems = '$cusWs/nuevosol.api.get_purchase_order_items';
  static final approvePO ='$cusWs/nuevosol.api.purchase_order_approval';
  static final userPermission ='$cusWs/nuevosol.api.check_user_permission'; 
  static final poApprovalAttachments = '$cusWs/nuevosol.api.get_po_with_attachments';

  static final forgotPassword = '$cusWs/frappe.core.doctype.user.user.reset_password';

  static final createPacking = '$cusWs/nuevosol.packing.create_production_posting_fc_and_packing';
  static final packingqrScanning = '$cusWs/nuevosol.packing.validate_and_save_component_scan';
}
