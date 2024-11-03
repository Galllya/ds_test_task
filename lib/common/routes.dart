import 'package:ds_test_task/presentation/hotel_selection/hotel_selection_page.dart';
import 'package:ds_test_task/presentation/reservation/reservation_page.dart';
import 'package:ds_test_task/presentation/room_selection/room_selection_page.dart';
import 'package:ds_test_task/presentation/successful_reservation/successful_reservation_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/hotel_selection",
      name: "hotel_selection",
      builder: (context, state) => const HotelSelectionPage(),
    ),
    GoRoute(
      path: "/room_selection",
      name: "room_selection",
      builder: (context, state) => RoomSelectionPage(
        hotelName: state.uri.queryParameters["hotelName"]!,
      ),
    ),
    GoRoute(
      path: "/reservation",
      name: "reservation",
      builder: (context, state) => ReservationPage(
        hotelName: state.uri.queryParameters["hotelName"]!,
      ),
    ),
    GoRoute(
      path: "/successful_reservation",
      name: "successful_reservation",
      builder: (context, state) => const SuccessfulReservationPage(),
    ),
  ],
  initialLocation: "/hotel_selection",
);
