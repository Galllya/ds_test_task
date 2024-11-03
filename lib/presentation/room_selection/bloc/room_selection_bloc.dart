import 'package:bloc/bloc.dart';
import 'package:ds_test_task/domain/model/room_model.dart';
import 'package:ds_test_task/domain/repository/hotel_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_selection_event.dart';
part 'room_selection_state.dart';
part 'room_selection_bloc.freezed.dart';

class RoomSelectionBloc extends Bloc<RoomSelectionEvent, RoomSelectionState> {
  final HotelRepository hotelRepository;
  RoomSelectionBloc({
    required this.hotelRepository,
  }) : super(const _Loading()) {
    on<RoomSelectionEvent>((event, emit) async {
      try {
        List<RoomModel> rooms = await hotelRepository.loadRooms();
        emit(RoomSelectionState.load(rooms: rooms));
      } catch (_) {
        emit(const RoomSelectionState.error());
      }
    });
  }
}
