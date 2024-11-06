part of 'init_dependencies.dart';

void initWordsDependencies(GetIt serviceLocator) {
  serviceLocator
    ..registerFactory<WordsLocalDatasource>(
        () => WordsLocalDataSourceImpl(database: serviceLocator()))
    ..registerFactory<WordsRepository>(
        () => WordsRepositoryImpl(localDatasource: serviceLocator()))
    ..registerFactory<AddWordUseCase>(
        () => AddWordUseCase(repository: serviceLocator()))
    ..registerFactory<DeleteWordUseCase>(
        () => DeleteWordUseCase(repository: serviceLocator()))
    ..registerFactory<UpdateWordsUseCase>(
        () => UpdateWordsUseCase(repository: serviceLocator()))
    ..registerFactory<GetAllWordsUseCase>(
        () => GetAllWordsUseCase(repository: serviceLocator()))
    ..registerFactory<AddAllWordsUseCase>(
        () => AddAllWordsUseCase(repository: serviceLocator()))
    ..registerLazySingleton<WordsBloc>(() => WordsBloc(
        getAllWordsUseCase: serviceLocator(),
        addWordUseCase: serviceLocator(),
        deleteWordUseCase: serviceLocator(),
        updateWordsUseCase: serviceLocator(),
        addAllWordsUseCase: serviceLocator()));
}
