import 'package:doux_sejour/core/network/api_client.dart';
import 'package:doux_sejour/features/login/data/login_api.dart';
import 'package:doux_sejour/features/login/data/login_repository_impl.dart';
import 'package:doux_sejour/features/login/domain/repositories/login_repository.dart';
import 'package:doux_sejour/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDep() {
  sl.registerLazySingleton(() => ApiClient(baseUrl: "http://localhost:3000"));
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton(() => LoginBloc(sl()));
}
