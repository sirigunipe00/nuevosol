import 'package:nuevosol/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {

  factory Urls.local() => const Urls('http://65.21.176.38:8000/api');
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
  static final createGateEntry = '$cusWs/nuevosol.gate_api.createGateEntry';
  // static final submitGateEntry = '$cusWs/shaktihormann.api.submit_gate_entry';
  static final createGateExit = '$cusWs/nuevosol.gate_api.createGateExit';
  // static final submitGateExit = '$cusWs/shaktihormann.api.submit_gate_exit';
  // static final createLogisticPlanning =
  //     '$cusWs/shaktihormann.api.create_logistic_planning';
  // static final updateLogisticPlanning =
  //     '$cusWs/shaktihormann.api.update_logistic_planning';
  // static final updateTransport='$cusWs/shaktihormann.api.update_logistic_transporter';
  // static final createVehicleReporting='$cusWs/shaktihormann.api.create_vehicle_reporting';

  static final getPurchaseOrders = '$cusWs/nuevosol.api.get_purchase_orders';
  static final getPoOrderItems = '$cusWs/nuevosol.api.get_purchase_order_items';
  static final approvePO ='$cusWs/nuevosol.api.purchase_order_approval';
  static final userPermission ='$cusWs/nuevosol.api.check_user_permission'; 
  static final poApprovalAttachments = '$cusWs/nuevosol.api.get_po_with_attachments';

}
