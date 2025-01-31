class Arrival {
  final String id;
  final String name;

  Arrival({required this.id, required this.name});

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return Arrival(
      id: json['id'],
      name: json['name'],
    );
  }
}