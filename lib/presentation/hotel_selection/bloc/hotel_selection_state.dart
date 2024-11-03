part of 'hotel_selection_bloc.dart';

@freezed
class HotelSelectionState with _$HotelSelectionState {
  const factory HotelSelectionState.loading() = _Loading;
  const factory HotelSelectionState.load({
    required List<HotelModel> hotels,
  }) = _Load;
  const factory HotelSelectionState.error() = _Error;
}
