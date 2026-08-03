import 'package:nuevosol/features/packing/model/packing_model.dart';

class PackingQualityArgs {
  const PackingQualityArgs({
    required this.packing,
    required this.inspectionLotId,
  });

  final PackingModel packing;
  final String inspectionLotId;
}
