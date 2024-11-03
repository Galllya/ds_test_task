part of 'room_selection_bloc.dart';

@freezed
class RoomSelectionEvent with _$RoomSelectionEvent {
  const factory RoomSelectionEvent.started() = _Started;
}
