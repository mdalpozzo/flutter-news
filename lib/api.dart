import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Story>> fetchStories() async {
  final response = await http.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=141960a854224ca88c06fe92789eb272');
  NewsJSON responseJson = NewsJSON.fromJson(jsonDecode(response.body));
  return responseJson.articles.map((story) => story).toList();
}

class Source {
  final String id;
  final String name;

  Source(this.id, this.name);

  Source.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'name': name,
    };
}

class NewsJSON {
  final List<Story> articles;

  NewsJSON({this.articles});

  factory NewsJSON.fromJson(Map<String, List<Story>> json) {
    return NewsJSON(
      articles: json['articles'],
    );
  }
    // : articles = json['articles'];
}

class Story {
  final String author;
  final String content;
  final String description;
  final String publishedAt;
  final Source source;
  final String title;
  final String url;
  final String urlToImage;

  Story({
    this.author,
    this.content,
    this.description,
    this.publishedAt,
    this.source,
    this.title,
    this.url,
    this.urlToImage,
  });

  Story.fromJson(Map<String, dynamic> json)
    : author = json['author'],
      content = json['content'],
      description = json['description'],
      publishedAt = json['publishedAt'],
      source = json['source'],
      title = json['title'],
      url = json['url'],
      urlToImage = json['urlToImage'];

  Map<String, dynamic> toJson() =>
    {
      'author': author,
      'content': content,
      'description': description,
      'publishedAt': publishedAt,
      'source': source,
      'title': title,
      'url': url,
      'urlToImage': urlToImage,
    };
}