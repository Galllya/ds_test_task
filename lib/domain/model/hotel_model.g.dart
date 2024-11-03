// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelModelImpl _$$HotelModelImplFromJson(Map<String, dynamic> json) =>
    _$HotelModelImpl(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      minimalPrice: (json['minimal_price'] as num).toInt(),
      name: json['name'] as String,
      rating: (json['rating'] as num).toInt(),
      ratingName: json['rating_name'] as String,
      aboutHotel:
          AboutHotel.fromJson(json['aboutHotel'] as Map<String, dynamic>),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$HotelModelImplToJson(_$HotelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'minimal_price': instance.minimalPrice,
      'name': instance.name,
      'rating': instance.rating,
      'rating_name': instance.ratingName,
      'aboutHotel': instance.aboutHotel,
      'image_urls': instance.imageUrls,
    };

_$AboutHotelImpl _$$AboutHotelImplFromJson(Map<String, dynamic> json) =>
    _$AboutHotelImpl(
      description: json['description'] as String,
      pecularities: (json['pecularities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AboutHotelImplToJson(_$AboutHotelImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'pecularities': instance.pecularities,
    };
