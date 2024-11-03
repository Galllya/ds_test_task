import 'package:dio/dio.dart';
import 'package:ds_test_task/common/network/app_config.dart';
import 'package:ds_test_task/domain/model/hotel_model.dart';
import 'package:ds_test_task/domain/model/reservation_model.dart';
import 'package:ds_test_task/domain/model/room_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/hotels')
  Future<List<HotelModel>> getHotels();

  @GET('/rooms')
  Future<List<RoomModel>> getRooms();

  @GET('/reservations')
  Future<List<ReservationModel>> getReservations();
}
