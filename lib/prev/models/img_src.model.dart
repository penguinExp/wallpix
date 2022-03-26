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
