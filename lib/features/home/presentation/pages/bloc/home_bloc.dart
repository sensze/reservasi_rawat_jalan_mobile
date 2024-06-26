import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/news_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/data/models/upcoming_schedule_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_news_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/features/home/domain/use_cases/get_upcoming_schedule_usecase.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNewsUseCase getNews = locator<GetNewsUseCase>();
  final GetUpcomingScheduleUseCase getUpcomingSchedule =
      locator<GetUpcomingScheduleUseCase>();

  HomeBloc() : super(HomeLoading()) {
    on<FetchHomeData>((event, emit) async {
      emit(HomeLoading());

      final newsResult = await getNews.call(null);
      final upcomingScheduleResult = await getUpcomingSchedule.call(null);

      if (newsResult.isLeft() || upcomingScheduleResult.isLeft()) {
        emit(const HomeFailure(message: "Error fetching data"));
      } else {
        final newsData = newsResult.getOrElse(() => []);
        final upcomingScheduleData = upcomingScheduleResult.getOrElse(() => []);

        emit(HomeSuccess(
            news: newsData, upcomingSchedule: upcomingScheduleData));
      }
    });
  }
}
