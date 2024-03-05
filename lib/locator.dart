import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/fake/news_fake_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/data_sources/news_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/data/repository/news_repository_impl.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/domain/repository/news_repository.dart';

import 'core/network/http_client.dart';
import 'data/data_sources/remote/clinic_remote_datasource.dart';
import 'data/repository/clinic_repository_impl.dart';

final locator = GetIt.instance;

Future<void> setupServiceLocator() async {
  /*Network*/
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<AppHttpClient>(AppHttpClient(dio: locator<Dio>()));
  /*Clinic*/
  locator.registerSingleton<ClinicDataSource>(ClinicRemoteDatasource());
  locator.registerSingleton<ClinicRepository>(ClinicRepositoryImpl());

  locator.registerSingleton<NewsDataSource>(NewsFakeDataSource());
  locator.registerSingleton<NewsRepository>(NewsRepositoryImpl());
}
