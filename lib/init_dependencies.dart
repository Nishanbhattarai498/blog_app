import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_proj/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:supabase_proj/core/secrets/app_secrets.dart';
import 'package:supabase_proj/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:supabase_proj/features/auth/data/reposetories/auth_reposetories_impl.dart';
import 'package:supabase_proj/features/auth/domain/repositery/auth_repository.dart';
import 'package:supabase_proj/features/auth/domain/usecases/current_user.dart';
import 'package:supabase_proj/features/auth/domain/usecases/user_signin.dart';
import 'package:supabase_proj/features/auth/domain/usecases/user_signup.dart';
import 'package:supabase_proj/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseurl,
    anonKey: AppSecrets.anonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
  _initAuth();

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: serviceLocator()),
  );
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UserSignUp(authRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(() => UserLogin(serviceLocator()));
  serviceLocator.registerFactory(() => CurrentUser(serviceLocator()));
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
    ),
  );
}
