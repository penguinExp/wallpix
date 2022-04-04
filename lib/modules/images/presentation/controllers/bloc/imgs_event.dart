part of 'imgs_bloc.dart';

abstract class ImgsEvent extends Equatable {
  const ImgsEvent();

  @override
  List<Object> get props => [];
}

class GetCuratedImgsEvent extends ImgsEvent {
  final int page;

  const GetCuratedImgsEvent({required this.page});
}

class SearchImgsEvent extends ImgsEvent {
  final int page;
  final String query;

  const SearchImgsEvent({required this.page, required this.query});
}
