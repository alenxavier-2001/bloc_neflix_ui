part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required bool isLoading,
    required bool hasError,
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneIsWatchingList,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
      isLoading: false,
      hasError: false,
      comingSoonList: [],
      everyOneIsWatchingList: []);
}
