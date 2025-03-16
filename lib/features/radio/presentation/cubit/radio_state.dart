part of 'radio_cubit.dart';

abstract class RadioState extends Equatable {
  const RadioState();

  @override
  List<Object> get props => [];
}

class RadioInitial extends RadioState {}

class RadioLoading extends RadioState {}

class RadioSuccess extends RadioState {
  final RadioModel radio;

  const RadioSuccess({required this.radio});
}

class RadioFailure extends RadioState {
  final String errorMessage;

  const RadioFailure({required this.errorMessage});
}
