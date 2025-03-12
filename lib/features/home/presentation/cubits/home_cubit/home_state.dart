part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLodaing extends HomeState {}

class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure({required this.errorMessage});
}

//* Books
class HomeBooksSuccess extends HomeState {
  final BooksModel booksModel;

  const HomeBooksSuccess({required this.booksModel});
}

//* Fatwa
class HomeFatwaSuccess extends HomeState {
  final FatwaModel fatwaModel;

  const HomeFatwaSuccess({required this.fatwaModel});
}

//* khotab
class HomeKhotabSuccess extends HomeState {
  final KhotabModel khotabModel;

  const HomeKhotabSuccess({required this.khotabModel});
}

//* Videos
class HomeVidoesSuccess extends HomeState {
  final VideosModel videoesModel;

  const HomeVidoesSuccess({required this.videoesModel});
}
