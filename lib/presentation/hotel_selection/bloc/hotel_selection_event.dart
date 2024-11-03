part of 'hotel_selection_bloc.dart';

@freezed
class HotelSelectionEvent with _$HotelSelectionEvent {
  const factory HotelSelectionEvent.started() = _Started;
}