import 'package:equatable/equatable.dart';

class ImgUrlsEntity extends Equatable {
  final String full;
  final String regular;
  final String small;

  const ImgUrlsEntity({
    required this.full,
    required this.regular,
    required this.small,
  });

  @override
  List<Object?> get props => [full, regular, small];

  fromJson(json) {}
}
