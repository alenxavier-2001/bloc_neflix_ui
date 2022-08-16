part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.initalize() = Initialize;
  const factory SearchEvent.searchEvent({
    required String movieQuery,
  }) = SearchMovie;
}
