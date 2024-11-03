// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RoomModel({
    required int id,
    required List<String> imageUrls,
    required String name,
    required List<String> pecularities,
    required int price,
    required String pricePer,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, Object?> json) =>
      _$RoomModelFromJson(json);
}
