import 'package:dartz/dartz.dart';
import 'package:via_cep_clean_dart/src/domain/entities/via_cep_entity.dart';
import 'package:via_cep_clean_dart/src/domain/repositories/get_cep_repository.dart';
import 'package:via_cep_clean_dart/src/domain/usescases/get_cep_usecase/get_cep_usecase.dart';

class GetCepUseCaseImp implements GetCepUseCase {
  final GetCepRepository _getCepRepository;

  GetCepUseCaseImp(this._getCepRepository);

  @override
  Future<Either<Exception, ViaCepEntity>> call({required String cep}) async {
    return await _getCepRepository(cep: cep);
  }
}
