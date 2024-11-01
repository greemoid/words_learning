part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerLazySingleton<AppDatabase>(() => AppDatabase());
  initCourseDependencies(serviceLocator);
  initWordsDependencies(serviceLocator);
}
