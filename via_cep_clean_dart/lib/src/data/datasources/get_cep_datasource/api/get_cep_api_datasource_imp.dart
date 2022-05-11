import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:via_cep_clean_dart/src/data/datasources/get_cep_datasource/get_cep_datasource.dart';
import 'package:via_cep_clean_dart/src/data/dtos/via_cep_dto.dart';
import 'package:via_cep_clean_dart/src/domain/entities/via_cep_entity.dart';
import 'package:via_cep_clean_dart/src/services/api/api_service_via_cep.dart';

class GetCepApiDataSourceImp implements GetCepDataSource {
  @override
  Future<Either<Exception, ViaCepEntity>> call({required String cep}) async {
    try {
      final response = await ApiServiceViaCep.dio.get('$cep/json/');

      if (response.data != null) {
        final ViaCepEntity map = ViaCepDto.fromMap(response.data);
        return Right(map);
      } else {
        return Left(Exception('Error datasource caiu aqui'));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return Left(Exception('Link quebrado :/'));
      }
      return Left(Exception(e.message));
    }
  }
}
