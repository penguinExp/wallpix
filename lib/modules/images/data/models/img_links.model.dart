class Links {
  Links({
    required this.download,
  });

  String download;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        download: json["download"],
      );

  Map<String, dynamic> toJson() => {
        "download": download,
      };
}
