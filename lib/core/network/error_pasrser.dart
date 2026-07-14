import 'package:nuevosol/core/logger/app_logger.dart';
import 'package:nuevosol/core/model/failure.dart';

Failure defaultErrorParser(
  Map<String, dynamic> response,
  String defErrorMessage,
) {
  try {
    if (response.containsKey('_server_messages')) {
      return Failure(
        error: response['exc_type']?.toString() ?? defErrorMessage,
        title: 'Message',
      );
    }

    late String errorMsg;

    if (response.containsKey('message')) {
      final message = response['message'];

      if (message is String) {
        errorMsg = message;
      } else if (message is Map<String, dynamic>) {
        errorMsg = message['message']?.toString() ?? defErrorMessage;
      } else {
        errorMsg = defErrorMessage;
      }
    } else {
      errorMsg = response['exception']?.toString() ?? defErrorMessage;
      errorMsg = errorMsg.replaceAll('frappe.exceptions.', '');
    }

    final excType = response['exc_type']?.toString();
    final exception = response['exception'];
    final stackTrace = response['exc'];

    $logger.error('[Frappe $errorMsg]', exception, stackTrace);

    return Failure(
      title: excType,
      error: errorMsg,
    );
  } on Exception catch (e, st) {
    $logger.error('[Error Parser]', e, st);
    throw const FormatException('Unrecognized json error response');
  }
}
