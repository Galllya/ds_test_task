import 'package:dio/dio.dart';
import 'package:ds_test_task/common/network/api.dart';
import 'package:ds_test_task/data/repository/hotel_repository_impl.dart';
import 'package:ds_test_task/data/repository/reservation_repository_impl.dart';
import 'package:ds_test_task/domain/repository/hotel_repository.dart';
import 'package:ds_test_task/domain/repository/reservation_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  final Dio dio = Dio();
  RestClient restApi = RestClient(dio);
  getIt.registerSingleton<HotelRepository>(
    HotelRepositoryImpl(api: restApi),
  );
  getIt.registerSingleton<ReservationRepository>(
    ReservationRepositoryImpl(api: restApi),
  );
}
