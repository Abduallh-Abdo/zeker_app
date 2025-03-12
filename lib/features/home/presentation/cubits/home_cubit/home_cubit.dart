import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zeker_app/features/home/data/models/books_model/books_model.dart';
import 'package:zeker_app/features/home/data/models/fatwa_model/fatwa_model.dart';
import 'package:zeker_app/features/home/data/models/khotab_model/khotab_model.dart';
import 'package:zeker_app/features/home/data/models/videos_model/videos_model.dart';
import 'package:zeker_app/features/home/data/repositories/home_repo.dart';
import 'package:quran/quran.dart' as quran;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  List<String> categories = ["سور القرآن", "كتب", "خطب", "فتوه", "فيديو"];
  String selectedCategory = "سور القرآن";
  final HomeRepo homeRepo;

  void selectCategory({required String category}) async {
    selectedCategory = category;
    emit(HomeLodaing());

    if (category == "سور القرآن") {
      log(quran.getPageData(1).toString());
    } else if (category == "كتب") {
      // Call Books API
      final response = await homeRepo.fetchBooksData();
      response.fold(
          (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
          (books) => emit(HomeBooksSuccess(booksModel: books)));
    } else if (category == "خطب") {
      // Call Khotab API
      final response = await homeRepo.fetchKhotabsData();
      response.fold(
        (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
        (khotab) => emit(HomeKhotabSuccess(khotabModel: khotab)),
      );
    } else if (category == "فتوه") {
      // Call Fatwa API
      final response = await homeRepo.fetchFatwasData();
      response.fold(
        (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
        (fatwa) => emit(HomeFatwaSuccess(fatwaModel: fatwa)),
      );
    } else if (category == "فيديو") {
      // Call Videos API
      final response = await homeRepo.fetchVideosData();
      response.fold(
        (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
        (videos) => emit(HomeVidoesSuccess(videoesModel: videos)),
      );
    }
  }
}
