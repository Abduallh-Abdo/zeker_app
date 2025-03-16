import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zeker_app/features/radio/data/models/radio_model/radio_model.dart';
import 'package:zeker_app/features/radio/data/repositories/radio_repo.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit(this.radioRepo) : super(RadioInitial());

  final RadioRepo radioRepo;

  Future<void> fetchRadioData() async {
    emit(RadioLoading());
    var result = await radioRepo.fetchRadioData();
    result.fold(
      (failure) {
        emit(RadioFailure(errorMessage: failure.errorMessage));
      },
      (radio) {
        emit(RadioSuccess(radio: radio));
      },
    );
  }
}
