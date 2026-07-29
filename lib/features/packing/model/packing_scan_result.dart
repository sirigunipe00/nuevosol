class PackingScanResult {
  const PackingScanResult({
    required this.message,
    this.name,
    this.productionPosting,
    this.bom,
    this.item,
    this.scannedValue,
    this.qrValidationType,
    this.scannedCount,
    this.noOfScan,
    this.remainingScans,
    this.master,
    this.revNo,
  });

  factory PackingScanResult.fromMessage(Map<String, dynamic> messageObj) {
    final data = messageObj['data'] as Map<String, dynamic>? ?? {};
    return PackingScanResult(
      message: messageObj['message']?.toString() ?? '',
      name: data['name']?.toString(),
      productionPosting: data['production_posting_fc_and_packing']?.toString(),
      bom: data['bom']?.toString(),
      item: data['item']?.toString(),
      scannedValue: data['scanned_value']?.toString(),
      qrValidationType: data['qr_validation_type']?.toString(),
      scannedCount: _asInt(data['scanned_count']),
      noOfScan: _asInt(data['no_of_scan']),
      remainingScans: _asInt(data['remaining_scans']),
      master: data['master']?.toString(),
      revNo: _asInt(data['rev_no']),
    );
  }

  final String message;
  final String? name;
  final String? productionPosting;
  final String? bom;
  final String? item;
  final String? scannedValue;
  final String? qrValidationType;
  final int? scannedCount;
  final int? noOfScan;
  final int? remainingScans;
  final String? master;
  final int? revNo;

  String dialogContent({required bool isSuccess}) {
    final buffer = StringBuffer(message);
    if (remainingScans != null) {
      buffer.write('\n\nRemaining scans: $remainingScans');
    }
    if (isSuccess && scannedCount != null && noOfScan != null) {
      buffer.write('\nScanned: $scannedCount / $noOfScan');
    }
    return buffer.toString();
  }

  static int? _asInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString());
  }
}
