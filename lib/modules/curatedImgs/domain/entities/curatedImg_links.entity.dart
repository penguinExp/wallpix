import 'package:equatable/equatable.dart';

class CuratedLinks extends Equatable {
  const CuratedLinks({
    required this.download,
  });

  final String download;

  @override
  List<Object?> get props => [download];
}
