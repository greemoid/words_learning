part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerLazySingleton<AppDatabase>(() => AppDatabase());
  initCourseFuture();
}

void initCourseFuture() {
  serviceLocator
    ..registerFactory<CourseLocalDataSource>(
        () => CourseLocalDataSourceImpl(database: serviceLocator()))
    ..registerFactory<CourseRepository>(
        () => CourseRepositoryImpl(localDataSource: serviceLocator()))
    ..registerFactory<AddCourseUseCase>(
        () => AddCourseUseCase(repository: serviceLocator()))
    ..registerFactory<DeleteCourseUseCase>(
        () => DeleteCourseUseCase(repository: serviceLocator()))
    ..registerFactory<GetAllCoursesUseCase>(
        () => GetAllCoursesUseCase(repository: serviceLocator()))
    ..registerLazySingleton<CourseBloc>(() => CourseBloc(
        addCourseUseCase: serviceLocator(),
        deleteCourseUseCase: serviceLocator(),
        getAllCoursesUseCase: serviceLocator()));
}
