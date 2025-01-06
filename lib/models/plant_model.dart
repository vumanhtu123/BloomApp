class Plant {
  final String id;
  final String name;
  final String description;

  Plant({required this.id, required this.name, required this.description});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
