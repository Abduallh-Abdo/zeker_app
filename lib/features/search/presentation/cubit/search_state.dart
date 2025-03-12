part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLodaing extends SearchState {}

class SearchPlayAudio extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchModel searchModel;

  const SearchLoaded({required this.searchModel});

  @override
  List<Object> get props => [searchModel];
}

class SearchFailure extends SearchState {
  final String message;

  const SearchFailure({required this.message});

  @override
  List<Object> get props => [message];
}
