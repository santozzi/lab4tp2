class CategorysEntity {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategorysEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });
}