import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/core/utils/typedefs.dart';
import 'package:nuevosol/features/transport_confirmation/model/transport_confirmation_form.dart';

abstract interface class TransportConfrimationRepo {
  AsyncValueOf<List<TransportConfirmationForm>> fetchTransports(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<Pair<String, String>> submitTransport(TransportConfirmationForm form);
   AsyncValueOf<Pair<String, String>> rejectTransport(TransportConfirmationForm form);
  
}
