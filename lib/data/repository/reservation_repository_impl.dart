import 'package:ds_test_task/common/network/api.dart';
import 'package:ds_test_task/domain/model/reservation_model.dart';
import 'package:ds_test_task/domain/repository/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final RestClient api;

  ReservationRepositoryImpl({required this.api});
  @override
  Future<List<ReservationModel>> loadReservations() async {
    return api.getReservations();
  }
}
