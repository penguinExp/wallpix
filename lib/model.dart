class Img {
  int id;
  String url;
  Src src;

  Img({
    required this.id,
    required this.src,
    required this.url,
  });

  factory Img.fromJson(Map<String, dynamic> json) {
    return Img(
      id: json['id'],
      src: Src.fromJson(json['src']),
      url: json['url'],
    );
  }
}

class Src {
  String portrait;
  String landScape;

  Src({
    required this.landScape,
    required this.portrait,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      landScape: json['landscape'],
      portrait: json['portrait'],
    );
  }
}

