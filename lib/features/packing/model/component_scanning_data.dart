class ComponentScanningData {
  const ComponentScanningData({
    this.name,
    this.parent,
    this.productionPosting,
    this.bom,
    this.item,
    this.scannedValue,
    this.creation,
    this.idx,
  });

  factory ComponentScanningData.fromJson(Map<String, dynamic> json) {
    return ComponentScanningData(
      name: json['name']?.toString(),
      parent: json['parent']?.toString(),
      productionPosting:
          json['production_posting_fc_and_packing']?.toString(),
      bom: json['bom']?.toString(),
      item: json['item']?.toString(),
      scannedValue: json['scanned_value']?.toString(),
      creation: json['creation']?.toString(),
      idx: json['idx'] is int
          ? json['idx'] as int
          : int.tryParse('${json['idx'] ?? ''}'),
    );
  }

  final String? name;
  final String? parent;
  final String? productionPosting;
  final String? bom;
  final String? item;
  final String? scannedValue;
  final String? creation;
  final int? idx;
}
