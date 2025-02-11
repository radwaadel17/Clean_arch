import 'package:bookly_app/features/home/data/data%20sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data%20sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
      homeLocalDataSource: HomeLocalDataSourceImp(),
      homeRemoteDataSource: HomeRemoteDataSourceImp()));
}
