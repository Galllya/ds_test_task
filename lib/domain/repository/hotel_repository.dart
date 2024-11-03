import 'package:ds_test_task/domain/model/hotel_model.dart';
import 'package:ds_test_task/domain/model/room_model.dart';

abstract class HotelRepository {
  Future<List<HotelModel>> loadHotels();
  Future<List<RoomModel>> loadRooms();
}
