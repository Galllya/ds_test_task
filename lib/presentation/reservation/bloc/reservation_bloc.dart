import 'package:bloc/bloc.dart';
import 'package:ds_test_task/domain/model/reservation_model.dart';
import 'package:ds_test_task/domain/repository/reservation_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationRepository reservationRepository;
  final String hotelName;
  ReservationBloc({
    required this.reservationRepository,
    required this.hotelName,
  }) : super(const _Loading()) {
    on<ReservationEvent>((event, emit) async {
      try {
        List<ReservationModel> reservations =
            await reservationRepository.loadReservations();

        ReservationModel reservation = reservations.firstWhere(
          (element) => element.hotelName == hotelName,
        );

        emit(
          ReservationState.load(reservation: reservation),
        );
      } catch (_) {
        emit(const ReservationState.error());
      }
    });
  }
}
