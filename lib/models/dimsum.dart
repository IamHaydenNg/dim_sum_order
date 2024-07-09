class DimSum {
  const DimSum({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.ingredients,
  });

  final String id;
  final String name;
  final String description;
  final String category;
  final List ingredients;

  factory DimSum.fromJson(Map<String, dynamic> json) {
    return DimSum(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      ingredients: json['ingredients'],
    );
  }
}
