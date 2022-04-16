class Pokemon {
  final int id;
  final String name;
  final String sprite;

  const Pokemon({required this.id, required this.name, required this.sprite});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      sprite: json['sprites']['front_default'],
    );
  }
}
