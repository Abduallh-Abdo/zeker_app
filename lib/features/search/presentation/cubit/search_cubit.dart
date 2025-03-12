import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran/quran.dart' as quran;
import 'package:zeker_app/core/helpers/audio_player.dart';
import 'package:zeker_app/features/search/data/models/search_model/result.dart';
import 'package:zeker_app/features/search/data/models/search_model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchModel? searchModel;
  bool isPlaying = false;

  void search({required List<String> words}) {
    emit(SearchLodaing());

    if (words.isEmpty) {
      emit(SearchFailure(message: "No search terms provided"));
      return;
    }

    Map<dynamic, dynamic>? result = quran.searchWords(words);

    if (result.isEmpty) {
      emit(SearchFailure(message: "No results found"));
    } else {
      searchModel = _mapResultToSearchModel(result);
      emit(SearchLoaded(searchModel: searchModel!));
    }
  }

  SearchModel _mapResultToSearchModel(Map<dynamic, dynamic> result) {
    int occurrences = result['occurrences'] ?? 0;
    List<Result> results = [];

    if (result['result'] != null && result['result'] is List) {
      results = (result['result'] as List)
          .map((item) => Result.fromJson(item))
          .toList();
    }

    return SearchModel(
      occurences: occurrences,
      result: results,
    );
  }

  void playAudio({required int verseNumber}) {
    if (isPlaying) {
      CustomAudioPlayer.stop();
      isPlaying = false;
    } else {
      CustomAudioPlayer.play(
        url: quran.getAudioURLByVerseNumber(verseNumber),
      );
      isPlaying = true;
    }
    emit(SearchPlayAudio());
  }


}
