import 'package:via_cep_clean_dart/src/domain/entities/via_cep_entity.dart';

abstract class ViaCepStates {}

class ViaCepInitialState extends ViaCepStates {}

class ViaCepLoadingState extends ViaCepStates {}

class ViaCepSucessState extends ViaCepStates {
  final ViaCepEntity viaCepEntity;

  ViaCepSucessState({
    required this.viaCepEntity,
  });
}

class ViaCepErrorState extends ViaCepStates {
  final String message;
  final StackTrace? stackTrace;

  ViaCepErrorState({
    required this.message,
    this.stackTrace,
  });
}
