import 'package:dartz/dartz.dart';
import 'package:via_cep_clean_dart/src/domain/entities/via_cep_entity.dart';

abstract class GetCepRepository {
  Future<Either<Exception, ViaCepEntity>> call({required String cep});
}
