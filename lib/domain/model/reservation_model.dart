// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'reservation_model.freezed.dart';
part 'reservation_model.g.dart';

@freezed
class ReservationModel with _$ReservationModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReservationModel({
    required String arrivalCountry,
    required String departure,
    required int fuelCharge,
    required int horating,
    required String hotelAddress,
    required String hotelName,
    required int id,
    required String numberOfNights,
    required String nutrition,
    required String ratingName,
    required String room,
    required int serviceCharge,
    required String tourDateStart,
    required String tourDateStop,
    required int tourPrice,
  }) = _ReservationModel;

  factory ReservationModel.fromJson(Map<String, Object?> json) =>
      _$ReservationModelFromJson(json);
}
