import 'package:neflix_ui/core/strings.dart';
import 'package:neflix_ui/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseurl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseurl/search/movie?api_key=$apiKey";
  static const hotAndNewMovie = "$kBaseurl/discover/movie?api_key=$apiKey";
  static const hotAndNewTv = "$kBaseurl/discover/tv?api_key=$apiKey";
}
