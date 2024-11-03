import 'package:bloc/bloc.dart';
import 'package:ds_test_task/domain/model/hotel_model.dart';
import 'package:ds_test_task/domain/repository/hotel_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_selection_event.dart';
part 'hotel_selection_state.dart';
part 'hotel_selection_bloc.freezed.dart';

class HotelSelectionBloc
    extends Bloc<HotelSelectionEvent, HotelSelectionState> {
  final HotelRepository hotelRepository;
  HotelSelectionBloc({
    required this.hotelRepository,
  }) : super(const _Loading()) {
    on<HotelSelectionEvent>(
      (event, emit) async {
        try {
          List<HotelModel> hotels = await hotelRepository.loadHotels();

          emit(
            HotelSelectionState.load(hotels: hotels),
          );
        } catch (_) {
          emit(const HotelSelectionState.error());
        }
      },
    );
  }
}
