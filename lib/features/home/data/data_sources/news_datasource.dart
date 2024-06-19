import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/news_model.dart';

abstract class NewsDataSource {
  Future<Either<Exception, List<NewsModel>>> getNews();
}
