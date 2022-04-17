class Pokemon {
  final int id;
  final String name;
  final String image;

  const Pokemon({required this.id, required this.name, required this.image});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['dream_world']['front_default'],
    );
  }
}
