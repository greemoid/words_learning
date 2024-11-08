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
    ..registerFactory<UpdateWordUseCase>(
        () => UpdateWordUseCase(repository: serviceLocator()))
    ..registerFactory<GetAllWordsUseCase>(
        () => GetAllWordsUseCase(repository: serviceLocator()))
    ..registerFactory<AddAllWordsUseCase>(
        () => AddAllWordsUseCase(repository: serviceLocator()))
    ..registerFactory<GetNecessaryWordsUseCase>(
        () => GetNecessaryWordsUseCase(repository: serviceLocator()))
    ..registerLazySingleton<WordsBloc>(() => WordsBloc(
          getAllWordsUseCase: serviceLocator(),
          addWordUseCase: serviceLocator(),
          deleteWordUseCase: serviceLocator(),
          addAllWordsUseCase: serviceLocator(),
        ))
    ..registerLazySingleton<LearningWordsBloc>(() => LearningWordsBloc(
        updateWordsUseCase: serviceLocator(),
        getNecessaryWordsUseCase: serviceLocator()));
}
