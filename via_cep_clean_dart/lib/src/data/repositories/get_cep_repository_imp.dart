import 'package:dartz/dartz.dart';
import 'package:via_cep_clean_dart/src/data/datasources/get_cep_datasource/get_cep_datasource.dart';
import 'package:via_cep_clean_dart/src/domain/entities/via_cep_entity.dart';
import 'package:via_cep_clean_dart/src/domain/repositories/get_cep_repository.dart';

class GetCepRepositoryImp implements GetCepRepository {
  final GetCepDataSource _getCepDataSource;

  GetCepRepositoryImp(this._getCepDataSource);

  @override
  Future<Either<Exception, ViaCepEntity>> call({required String cep}) async {
    return await _getCepDataSource(
      cep: cep,
    );
  }
}
