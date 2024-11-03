import 'package:ds_test_task/common/di.dart';
import 'package:ds_test_task/common/ui/app_colors.dart';
import 'package:ds_test_task/common/utils.dart';
import 'package:ds_test_task/common/widgets/app_error_container.dart';
import 'package:ds_test_task/common/widgets/app_loader.dart';
import 'package:ds_test_task/common/widgets/app_text_field.dart';
import 'package:ds_test_task/common/widgets/base_container.dart';
import 'package:ds_test_task/common/widgets/rating_container.dart';
import 'package:ds_test_task/domain/model/reservation_model.dart';
import 'package:ds_test_task/domain/repository/reservation_repository.dart';
import 'package:ds_test_task/presentation/reservation/bloc/reservation_bloc.dart';
import 'package:ds_test_task/presentation/reservation/widgets/information_row.dart';
import 'package:ds_test_task/presentation/reservation/widgets/reservation_final_info_row.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class ReservationPage extends StatefulWidget {
  final String hotelName;
  const ReservationPage({
    super.key,
    required this.hotelName,
  });

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late ReservationBloc _reservationBloc;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = true;

  final List<TextEditingController> _nameControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _surnameControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _birthdayControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _citizenshipControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _passportNumberControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _validityPeriodNumberControllers = [
    TextEditingController()
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _reservationBloc = ReservationBloc(
      reservationRepository: getIt<ReservationRepository>(),
      hotelName: widget.hotelName,
    );
    _startLoading();
    _emailController.addListener(
      () {
        setState(() {
          _isEmailValid = EmailValidator.validate(_emailController.text);
        });
      },
    );

    super.initState();
  }

  void _startLoading() {
    _reservationBloc.add(const ReservationEvent.started());
  }

  final List<String> _touristOrdinalNumbers = [
    "Первый турист",
    "Второй турист",
    "Третий турист",
    "Четверный турист",
    "Пятый турист",
  ];

  final List<bool> _isTouristCardsOpen = [true];

  Widget _buildBaseInfo(ReservationModel reservation) {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingContainer(
            rating: reservation.horating,
            ratingName: reservation.ratingName,
          ),
          SizedBox(height: 6.r),
          Text(
            reservation.hotelName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainTourInfo(ReservationModel reservation) {
    return BaseContainer(
      child: Column(
        children: [
          const InformationRow(
            title: "Вылет из",
            value: "Москва",
          ),
          InformationRow(
            title: "Страна, город",
            value: reservation.arrivalCountry,
          ),
          InformationRow(
            title: "Даты",
            value:
                "${Utils.formatDate(reservation.tourDateStart)} - ${Utils.formatDate(reservation.tourDateStop)}",
          ),
          InformationRow(
            title: "Кол-во ночей",
            value: Utils.formatNumberOfNights(
              int.parse(
                reservation.numberOfNights,
              ),
            ),
          ),
          InformationRow(
            title: "Отель",
            value: reservation.hotelName,
          ),
          InformationRow(
            title: "Вылет из",
            value: reservation.arrivalCountry,
          ),
          InformationRow(
            title: "Номер",
            value: reservation.room,
          ),
          InformationRow(
            title: "Питание",
            value: reservation.nutrition,
            showBottomPadding: false,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutBuyer() {
    return BaseContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Информация о покупателе",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.r),
          AppTextField(
            controller: _phoneNumberController,
            lableText: "Номер телефона",
            isPhoneNumber: true,
          ),
          SizedBox(height: 10.r),
          AppTextField(
            isValid: _isEmailValid,
            controller: _emailController,
            lableText: "Почта",
            isEmail: _isEmailValid,
            textInputActionNext: false,
          ),
          SizedBox(height: 10.r),
          Text(
            'Эти данные никому не передаются. После оплаты мы вышлим чек на указанный вами номер и почту.',
            style: TextStyle(
              fontSize: 14.sp,
              height: 1,
              color: AppColors.subTitle,
            ),
          ),
        ],
      ),
    );
  }

  void _changeTouristCardOpen(int index) {
    setState(() {
      _isTouristCardsOpen[index] = !_isTouristCardsOpen[index];
    });
    if (_isTouristCardsOpen[index]) {
      _scrollController.animateTo(
        _scrollController.offset + 320.r,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  void _deleteTouristCard(int index) {
    setState(() {
      _nameControllers.removeAt(index);
      _surnameControllers.removeAt(index);
      _birthdayControllers.removeAt(index);
      _citizenshipControllers.removeAt(index);
      _passportNumberControllers.removeAt(index);
      _validityPeriodNumberControllers.removeAt(index);
      _isTouristCardsOpen.removeAt(index);
    });
  }

  Widget _buildTourist(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: BaseContainer(
        child: Column(
          children: [
            InkWell(
              onTap: () => _changeTouristCardOpen(index),
              child: Row(
                children: [
                  Text(
                    _touristOrdinalNumbers[index],
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    _isTouristCardsOpen[index]
                        ? "assets/icons/collapse_icon.svg"
                        : "assets/icons/more_icon.svg",
                    width: 30.r,
                  ),
                  if (index != 0)
                    Padding(
                      padding: EdgeInsets.only(left: 10.r),
                      child: GestureDetector(
                        onTap: () => _deleteTouristCard(index),
                        child: SvgPicture.asset(
                          "assets/icons/close_icon.svg",
                          width: 30.r,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.r),
            if (_isTouristCardsOpen[index])
              Column(
                children: [
                  AppTextField(
                    controller: _nameControllers[index],
                    lableText: "Имя",
                  ),
                  SizedBox(height: 6.r),
                  AppTextField(
                    controller: _surnameControllers[index],
                    lableText: "Фамилия",
                  ),
                  SizedBox(height: 6.r),
                  AppTextField(
                    controller: _birthdayControllers[index],
                    lableText: "Дата рождения",
                    isDate: true,
                  ),
                  SizedBox(height: 6.r),
                  AppTextField(
                    controller: _citizenshipControllers[index],
                    lableText: "Гражданство",
                  ),
                  SizedBox(height: 6.r),
                  AppTextField(
                    controller: _passportNumberControllers[index],
                    lableText: "Номер загранпаспорта",
                    isNumber: true,
                  ),
                  SizedBox(height: 6.r),
                  AppTextField(
                    controller: _validityPeriodNumberControllers[index],
                    lableText: "Срок действия загранпаспорта",
                    textInputActionNext: false,
                    isDate: true,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _addTouristCard() {
    setState(() {
      _nameControllers.add(TextEditingController());
      _surnameControllers.add(TextEditingController());
      _birthdayControllers.add(TextEditingController());
      _citizenshipControllers.add(TextEditingController());
      _passportNumberControllers.add(TextEditingController());
      _validityPeriodNumberControllers.add(TextEditingController());
      _isTouristCardsOpen.add(true);
    });
  }

  Widget _buildAddTouristCard() {
    if (_nameControllers.length != 5) return const SizedBox();
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: GestureDetector(
        onTap: _addTouristCard,
        child: BaseContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Добавить туриста",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/add_icon.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrize(ReservationModel reservation, int finalPrize) {
    return BaseContainer(
      child: Column(
        children: [
          ReservationFinalInfoRow(
            title: "Тур",
            value: reservation.tourPrice,
          ),
          ReservationFinalInfoRow(
            title: "Топливный сбор",
            value: reservation.fuelCharge,
          ),
          ReservationFinalInfoRow(
            title: "Сервисный сбор",
            value: reservation.serviceCharge,
          ),
          ReservationFinalInfoRow(
            isLast: true,
            title: "К оплате",
            value: finalPrize,
          ),
        ],
      ),
    );
  }

  void _onPay() {
    bool isAllValid = true;
    if (_phoneNumberController.text.isEmpty) {
      isAllValid = false;
    }
    if (_emailController.text.isEmpty) {
      isAllValid = false;
    }
    for (int i = 0; i < _nameControllers.length; i++) {
      if (_nameControllers[i].text.isEmpty) {
        isAllValid = false;
      }
      if (_surnameControllers[i].text.isEmpty) {
        isAllValid = false;
      }
      if (_birthdayControllers[i].text.isEmpty) {
        isAllValid = false;
      }
      if (_citizenshipControllers[i].text.isEmpty) {
        isAllValid = false;
      }
      if (_passportNumberControllers[i].text.isEmpty) {
        isAllValid = false;
      }
      if (_validityPeriodNumberControllers[i].text.isEmpty) {
        isAllValid = false;
      }
    }
    if (!_isEmailValid) {
      isAllValid = false;
    }
    if (isAllValid) {
      context.pushNamed("successful_reservation");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Center(
            child: Text(
              "Please fill in all the details",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: AppColors.primary,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _reservationBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text("Бронирование")),
        body: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            return state.when(
              load: (reservation) {
                int finalPrize = reservation.tourPrice +
                    reservation.fuelCharge +
                    reservation.serviceCharge;
                return ListView(
                  controller: _scrollController,
                  children: [
                    SizedBox(height: 10.r),
                    _buildBaseInfo(reservation),
                    SizedBox(height: 10.r),
                    _buildMainTourInfo(reservation),
                    SizedBox(height: 10.r),
                    _buildAboutBuyer(),
                    SizedBox(height: 10.r),
                    for (int i = 0; i < _nameControllers.length; i++)
                      _buildTourist(i),
                    _buildAddTouristCard(),
                    _buildPrize(reservation, finalPrize),
                    SizedBox(height: 10.r),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: ElevatedButton(
                        onPressed: _onPay,
                        child: Text("Оплатить $finalPrize ₽"),
                      ),
                    ),
                    SizedBox(height: 40.r),
                  ],
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
