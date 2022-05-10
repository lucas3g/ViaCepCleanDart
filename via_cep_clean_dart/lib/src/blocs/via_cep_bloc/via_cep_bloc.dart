import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep_clean_dart/src/blocs/events/via_cep_events.dart';
import 'package:via_cep_clean_dart/src/blocs/states/via_cep_states.dart';
import 'package:via_cep_clean_dart/src/domain/usescases/get_cep_usecase/get_cep_usecase.dart';

class ViaCepBloc extends Bloc<ViaCepEvents, ViaCepStates> {
  final GetCepUseCase _getCepUseCase;

  ViaCepBloc(this._getCepUseCase) : super(ViaCepInitialState()) {
    on<GetCepEvent>(_getCep);
  }

  Future<void> _getCep(GetCepEvent event, emit) async {
    emit(ViaCepLoadingState());
    final result = await _getCepUseCase(cep: event.cep);

    result.fold(
      (error) => emit(ViaCepErrorState(message: 'Error ao buscar cep')),
      (success) => emit(
        ViaCepSucessState(viaCepEntity: success),
      ),
    );
  }
}
