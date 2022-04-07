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

class AddToCuratedImgsEvent extends ImgsEvent {
  final int page;

  const AddToCuratedImgsEvent({required this.page});
}

class SearchImgsEvent extends ImgsEvent {
  final int page;
  final String query;

  const SearchImgsEvent({required this.page, required this.query});
}

class LoadMoreEvent extends ImgsEvent {
  final int page;

  const LoadMoreEvent(this.page);
}

// Should have a globbal variable in the ui for the list of imgs
/*
1. Loading
2. Loaded -> List of imgs
3. Load More(List of Imgs) -> List of imgs
4. Search For the img by query(query) -> List of imgs
 */