class IPost {
  late String id;
  late String author;
  late String url;

  IPost(
      {required this.id,
        required this.author,
        required this.url,});

  IPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    url = json['download_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['author'] = author;
    data['url'] = url;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return url;
  }
}