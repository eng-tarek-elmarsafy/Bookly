import 'package:bookly_app/Feature/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/Feature/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:bookly_app/Feature/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServesLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImp(),
    ),
  );
}
