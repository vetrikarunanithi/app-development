class Program {
  final String id;
  final String title;
  final String duration;
  final String level;
  final String description;
  final double rating;
  final int reviewCount;
  final String mode;
  final String language;
  final String priceLabel;

  Program({
    required this.id,
    required this.title,
    required this.duration,
    required this.level,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.mode,
    required this.language,
    required this.priceLabel,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      duration: json['duration'] ?? '',
      level: json['level'] ?? '',
      description: json['description'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      mode: json['mode'] ?? '',
      language: json['language'] ?? '',
      priceLabel: json['priceLabel'] ?? '',
    );
  }
}
