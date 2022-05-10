import 'package:get_it/get_it.dart';
import 'package:via_cep_clean_dart/src/blocs/via_cep_bloc/via_cep_bloc.dart';
import 'package:via_cep_clean_dart/src/data/datasources/get_cep_datasource/api/get_cep_api_datasource_imp.dart';
import 'package:via_cep_clean_dart/src/data/datasources/get_cep_datasource/get_cep_datasource.dart';
import 'package:via_cep_clean_dart/src/data/repositories/get_cep_repository_imp.dart';
import 'package:via_cep_clean_dart/src/domain/repositories/get_cep_repository.dart';
import 'package:via_cep_clean_dart/src/domain/usescases/get_cep_usecase/get_cep_usecase.dart';
import 'package:via_cep_clean_dart/src/domain/usescases/get_cep_usecase/get_cep_usecase_imp.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //DATASOURCES
    getIt.registerLazySingleton<GetCepDataSource>(
      () => GetCepApiDataSourceImp(),
    );

    //REPOSITORIES
    getIt.registerLazySingleton<GetCepRepository>(
      () => GetCepRepositoryImp(getIt()),
    );

    //USESCASES
    getIt.registerLazySingleton<GetCepUseCase>(
      () => GetCepUseCaseImp(getIt()),
    );

    //BLOCS
    getIt.registerLazySingleton<ViaCepBloc>(() => ViaCepBloc(getIt()));
  }
}
