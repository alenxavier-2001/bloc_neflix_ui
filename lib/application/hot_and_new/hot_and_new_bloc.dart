import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neflix_ui/domain/core/failures/main_failure.dart';
import 'package:neflix_ui/domain/hot_and_new_resp/hot_and_new_service.dart';
import 'package:neflix_ui/domain/hot_and_new_resp/models/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;

  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(const HotAndNewState(
          isLoading: true,
          hasError: false,
          comingSoonList: [],
          everyOneIsWatchingList: []));

      //get data from remote

      //get hot and new movie data
      final result = await _hotAndNewService.getHotAndNewMovieData();
      //data to state

      final newState = result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
              isLoading: false,
              hasError: true,
              comingSoonList: [],
              everyOneIsWatchingList: []);
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
              isLoading: false,
              hasError: false,
              comingSoonList: resp.results,
              everyOneIsWatchingList: state.everyOneIsWatchingList);
        },
      );
      emit(newState);
    });
    //get hot and new t data
    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      //send loading to ui
      emit(const HotAndNewState(
          isLoading: true,
          hasError: false,
          comingSoonList: [],
          everyOneIsWatchingList: []));

      //get data from remote

      //get hot and new movie data
      final result = await _hotAndNewService.getHotAndNewTvData();
      //data to state

      final newState = result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
              isLoading: false,
              hasError: true,
              comingSoonList: [],
              everyOneIsWatchingList: []);
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
              isLoading: false,
              hasError: false,
              comingSoonList: state.comingSoonList,
              everyOneIsWatchingList: resp.results);
        },
      );
      emit(newState);
    });
  }
}
