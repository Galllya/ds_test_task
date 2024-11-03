import 'package:ds_test_task/domain/model/reservation_model.dart';

abstract class ReservationRepository {
  Future<List<ReservationModel>> loadReservations();
}
