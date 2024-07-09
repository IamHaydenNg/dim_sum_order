class DimSumCategory {
  const DimSumCategory({
    required this.s,
    required this.m,
    required this.l,
    required this.special,
    required this.tea,
    required this.service,
  });

  final double s;
  final double m;
  final double l;
  final double special;
  final double tea;
  final double service;

  factory DimSumCategory.fromJson(Map<String, dynamic> json) {
    return DimSumCategory(
      s: json['s'],
      m: json['m'],
      l: json['l'],
      special: json['special'],
      tea: json['tea'],
      service: json['service'],
    );
  }
}
