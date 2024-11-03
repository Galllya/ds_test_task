import 'package:ds_test_task/common/di.dart';
import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:ds_test_task/common/widgets/app_error_container.dart';
import 'package:ds_test_task/common/widgets/app_loader.dart';
import 'package:ds_test_task/common/widgets/base_container.dart';
import 'package:ds_test_task/common/widgets/base_wrap.dart';
import 'package:ds_test_task/common/widgets/images_container.dart';
import 'package:ds_test_task/domain/repository/hotel_repository.dart';
import 'package:ds_test_task/presentation/room_selection/bloc/room_selection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RoomSelectionPage extends StatefulWidget {
  final String hotelName;
  const RoomSelectionPage({
    super.key,
    required this.hotelName,
  });

  @override
  State<RoomSelectionPage> createState() => _RoomSelectionPageState();
}

class _RoomSelectionPageState extends State<RoomSelectionPage> {
  late RoomSelectionBloc _roomSelectionBloc;

  @override
  void initState() {
    _roomSelectionBloc = RoomSelectionBloc(
      hotelRepository: getIt<HotelRepository>(),
    );
    _startLoading();
    super.initState();
  }

  void _startLoading() {
    _roomSelectionBloc.add(const RoomSelectionEvent.started());
  }

  _openReservationPage() {
    context.pushNamed(
      "reservation",
      queryParameters: {
        "hotelName": widget.hotelName,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _roomSelectionBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.hotelName),
        ),
        body: BlocBuilder<RoomSelectionBloc, RoomSelectionState>(
          builder: (context, state) {
            return state.when(
              load: (rooms) {
                return ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.r),
                      child: BaseContainer(
                        showTopBorderRadius: index != 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImagesContainer(images: rooms[index].imageUrls),
                            SizedBox(height: 10.r),
                            Text(
                              rooms[index].name,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 6.r),
                            BaseWrap(items: rooms[index].pecularities),
                            SizedBox(height: 10.r),
                            Row(
                              children: [
                                Text(
                                  "${rooms[index].price} ₽",
                                  style: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(width: 8.r),
                                Text(
                                  "за 7 ночей с перелетом",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.subTitle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.r),
                            ElevatedButton(
                              onPressed: _openReservationPage,
                              child: const Text("Выбрать номер"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const AppLoader(),
              error: () => AppErrorContainer(reload: _startLoading),
            );
          },
        ),
      ),
    );
  }
}
