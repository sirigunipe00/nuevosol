class ComponentScanningData {
  const ComponentScanningData({
    this.name,
    this.productionPosting,
    this.bom,
    this.item,
    this.scannedValue,
    this.creation,
  });

  factory ComponentScanningData.fromJson(Map<String, dynamic> json) {
    return ComponentScanningData(
      name: json['name']?.toString(),
      productionPosting:
          json['production_posting_fc_and_packing']?.toString(),
      bom: json['bom']?.toString(),
      item: json['item']?.toString(),
      scannedValue: json['scanned_value']?.toString(),
      creation: json['creation']?.toString(),
    );
  }

  final String? name;
  final String? productionPosting;
  final String? bom;
  final String? item;
  final String? scannedValue;
  final String? creation;
}
