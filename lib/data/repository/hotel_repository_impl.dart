import 'package:ds_test_task/common/network/api.dart';
import 'package:ds_test_task/domain/model/hotel_model.dart';
import 'package:ds_test_task/domain/model/room_model.dart';
import 'package:ds_test_task/domain/repository/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final RestClient api;

  HotelRepositoryImpl({required this.api});
  @override
  Future<List<HotelModel>> loadHotels() {
    return api.getHotels();
  }

  @override
  Future<List<RoomModel>> loadRooms() {
    return api.getRooms();
  }
}
