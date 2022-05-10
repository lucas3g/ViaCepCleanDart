import 'package:dio/dio.dart';

class ApiServiceViaCep {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'http://viacep.com.br/ws/'));
}
