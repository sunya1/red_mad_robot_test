NewsModel newsFromJson(dynamic str) => NewsModel.fromJson(str);

class NewsModel {
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<ArticleModel> articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleModel>.from(
            json["articles"].map((x) => ArticleModel.fromJson(x))),
      );
}

class ArticleModel {
  ArticleModel({
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String? author;
  String title;
  String description;
  String? url;
  String urlToImage;
  DateTime? publishedAt;
  String? content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        author: json["author"],
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            "https://static.displate.com/857x1200/displate/2022-07-07/fb201c5aef2a8558a1eec3a095be6d49_1c1023275f02c2ee7bc146309a812775.jpg",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}
