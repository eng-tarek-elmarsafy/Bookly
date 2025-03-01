import 'package:bookly_app/Feature/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Feature/search/data/repo/search_repo_imp.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(getIt.get<ApiService>()));

  getIt.registerSingleton(SearchRepoImp(apiService: getIt.get<ApiService>()));
}
