class GameModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final String openGiveAwayUrl;
  final String publishedDate;
  final String endDate;
  final String instructions;
  final String platform;

  GameModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.openGiveAwayUrl,
    required this.publishedDate,
    required this.endDate,
    required this.instructions,
    required this.platform,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "0",
        image: json["image"] ?? "0",
        description: json["description"] ?? "0",
        openGiveAwayUrl: json["open_giveaway_url"] ?? "0",
        publishedDate: json["published_date"] ?? "0",
        endDate: json["10"] ?? "0",
        instructions: json["instructions"] ?? "0",
        platform: json["platforms"]);
  }
}
