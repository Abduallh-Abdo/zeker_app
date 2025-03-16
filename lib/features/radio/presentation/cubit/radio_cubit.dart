import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
}
