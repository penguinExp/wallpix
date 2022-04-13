import 'package:equatable/equatable.dart';

class ImgLinksEntity extends Equatable {
  const ImgLinksEntity({
    required this.download,
  });

  final String download;

  @override
  List<Object?> get props => [download];
}
