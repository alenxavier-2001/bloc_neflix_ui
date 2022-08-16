import 'package:dartz/dartz.dart';
import 'package:neflix_ui/domain/core/failures/main_failure.dart';
import 'package:neflix_ui/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
