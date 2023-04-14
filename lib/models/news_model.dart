class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
        author: map['author'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        urlToImage: map['urlToImage'],
        publishedAt: map['image'],
        content: map['content']);
  }
}