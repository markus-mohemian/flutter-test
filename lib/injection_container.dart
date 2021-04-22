import 'package:get_it/get_it.dart';

import 'features/login/data/datasources/login_user.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login_with_credentials.dart';
import 'features/login/presentation/bloc/login_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
}

void initInjections(GetIt serviceLocator) {
  serviceLocator.registerFactory(
    () => LoginBloc(
      loginUseCase: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => LoginWithCredentials(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => LoginUser(),
  );
}
