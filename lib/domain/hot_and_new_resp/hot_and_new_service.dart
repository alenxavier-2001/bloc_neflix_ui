import 'package:dartz/dartz.dart';
import 'package:neflix_ui/domain/core/failures/main_failure.dart';
import 'package:neflix_ui/domain/hot_and_new_resp/models/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}
