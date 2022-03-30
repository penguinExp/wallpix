class SrcModel {
  String portrait;
  String landScape;

  SrcModel({
    required this.landScape,
    required this.portrait,
  });

  factory SrcModel.fromJson(Map<String, dynamic> json) {
    return SrcModel(
      landScape: json['landscape'],
      portrait: json['portrait'],
    );
  }
}
