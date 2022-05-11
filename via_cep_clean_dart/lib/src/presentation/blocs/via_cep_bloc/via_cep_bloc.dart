import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep_clean_dart/src/domain/usescases/get_cep_usecase/get_cep_usecase.dart';
import 'package:via_cep_clean_dart/src/presentation/blocs/events/via_cep_events.dart';
import 'package:via_cep_clean_dart/src/presentation/blocs/states/via_cep_states.dart';

class ViaCepBloc extends Bloc<ViaCepEvents, ViaCepStates> {
  final GetCepUseCase getCepUseCase;
  ViaCepBloc({required this.getCepUseCase}) : super(ViaCepInitialState()) {
    on<GetCepEvent>(_getCep);
  }

  Future<void> _getCep(GetCepEvent event, emit) async {
    emit(ViaCepLoadingState());
    final result = await getCepUseCase(cep: event.cep);

    result.fold((error) => emit(ViaCepErrorState(message: error.toString())),
        (success) {
      return emit(
        ViaCepSucessState(viaCepEntity: success),
      );
    });
  }
}
