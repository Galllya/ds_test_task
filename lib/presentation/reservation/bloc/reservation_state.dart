part of 'reservation_bloc.dart';

@freezed
class ReservationState with _$ReservationState {
  const factory ReservationState.loading() = _Loading;
  const factory ReservationState.load({
    required ReservationModel reservation,
  }) = _Load;
  const factory ReservationState.error() = _Error;
}
