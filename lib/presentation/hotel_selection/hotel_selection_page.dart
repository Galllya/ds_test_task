import 'package:ds_test_task/common/di.dart';
import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:ds_test_task/common/widgets/app_error_container.dart';
import 'package:ds_test_task/common/widgets/app_loader.dart';
import 'package:ds_test_task/common/widgets/base_container.dart';
import 'package:ds_test_task/common/widgets/base_wrap.dart';
import 'package:ds_test_task/common/widgets/images_container.dart';
import 'package:ds_test_task/common/widgets/rating_container.dart';
import 'package:ds_test_task/domain/model/hotel_model.dart';
import 'package:ds_test_task/domain/repository/hotel_repository.dart';
import 'package:ds_test_task/presentation/hotel_selection/bloc/hotel_selection_bloc.dart';
import 'package:ds_test_task/presentation/hotel_selection/widgets/hotel_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HotelSelectionPage extends StatefulWidget {
  const HotelSelectionPage({super.key});

  @override
  State<HotelSelectionPage> createState() => _HotelSelectionPageState();
}

class _HotelSelectionPageState extends State<HotelSelectionPage> {
  late HotelSelectionBloc _hotelSelectionBloc;

  @override
  void initState() {
    _hotelSelectionBloc = HotelSelectionBloc(
      hotelRepository: getIt<HotelRepository>(),
    );
    _startLoading();
    super.initState();
  }

  void _startLoading() {
    _hotelSelectionBloc.add(const HotelSelectionEvent.started());
  }

  Widget _buildHeaderInfo(HotelModel hotel, int index) {
    return BaseContainer(
      showTopBorderRadius: index != 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImagesContainer(images: hotel.imageUrls),
          SizedBox(height: 20.r),
          RatingContainer(
            rating: hotel.rating,
            ratingName: hotel.ratingName,
          ),
          SizedBox(height: 10.r),
          Text(
            hotel.name,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.r),
          Text(
            hotel.address,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.primary.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.r),
          Row(
            children: [
              Text(
                "от ${hotel.minimalPrice} ₽",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 8.r),
              Text(
                "за тур с перелётом",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.subTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutHotel(HotelModel hotel) {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: double.infinity),
          Text(
            "Об отеле",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.r),
          BaseWrap(items: hotel.aboutHotel.pecularities),
          SizedBox(height: 6.r),
          Text(
            hotel.aboutHotel.description,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.r),
          const HotelAction(
            icon: "assets/icons/happy_emoji_icon.svg",
            title: "Удобства",
          ),
          const HotelAction(
            icon: "assets/icons/checked_icon.svg",
            title: "Что включено",
          ),
          const HotelAction(
            icon: "assets/icons/close_icon.svg",
            title: "Что не включено",
          ),
        ],
      ),
    );
  }

  _openRoomSelectionPage(HotelModel hotel) {
    return context.pushNamed(
      "room_selection",
      queryParameters: {
        "hotelName": hotel.name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _hotelSelectionBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text("Отель")),
        body: BlocBuilder<HotelSelectionBloc, HotelSelectionState>(
          builder: (context, state) {
            return state.when(
              load: (hotels) => ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (BuildContext context, int index) {
                  HotelModel hotelModel = hotels[index];
                  return Column(
                    children: [
                      _buildHeaderInfo(hotelModel, index),
                      SizedBox(height: 20.r),
                      _buildAboutHotel(hotelModel),
                      SizedBox(height: 20.r),
                      BaseContainer(
                        child: ElevatedButton(
                          onPressed: () => _openRoomSelectionPage(hotelModel),
                          child: const Text("К выбору номера"),
                        ),
                      ),
                      SizedBox(height: 40.r),
                    ],
                  );
                },
              ),
              loading: () => const AppLoader(),
              error: () => AppErrorContainer(
                reload: _startLoading,
              ),
            );
          },
        ),
      ),
    );
  }
}
