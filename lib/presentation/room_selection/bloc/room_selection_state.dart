part of 'room_selection_bloc.dart';

@freezed
class RoomSelectionState with _$RoomSelectionState {
  const factory RoomSelectionState.loading() = _Loading;
  const factory RoomSelectionState.load({
    required List<RoomModel> rooms,
  }) = _Load;
  const factory RoomSelectionState.error() = _Error;
}
