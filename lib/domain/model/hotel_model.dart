// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'hotel_model.freezed.dart';
part 'hotel_model.g.dart';

@freezed
class HotelModel with _$HotelModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HotelModel({
    required int id,
    required String address,
    required int minimalPrice,
    required String name,
    required int rating,
    required String ratingName,
    @JsonKey(name: 'aboutHotel') required AboutHotel aboutHotel,
    required List<String> imageUrls,
  }) = _HotelModel;

  factory HotelModel.fromJson(Map<String, Object?> json) =>
      _$HotelModelFromJson(json);
}

@freezed
class AboutHotel with _$AboutHotel {
  const factory AboutHotel({
    required String description,
    required List<String> pecularities,
  }) = _AboutHotel;

  factory AboutHotel.fromJson(Map<String, Object?> json) =>
      _$AboutHotelFromJson(json);
}
