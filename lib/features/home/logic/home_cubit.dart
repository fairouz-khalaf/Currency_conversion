import 'package:currency_watch/core/helpers/enums.dart';
import 'package:currency_watch/core/helpers/main_functions.dart';
import 'package:currency_watch/core/theme/app_colors.dart';
import 'package:currency_watch/features/home/data/repos/home_repo.dart';
import 'package:currency_watch/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState()) {
    startDateController = TextEditingController(
      text: dateFormatMethod(
        dateTimeAsString:
            DateTime.now().subtract(const Duration(days: 11)).toString(),
        pattern: "yyyy-MM-dd",
      ),
    );

    pickedDateStart = DateTime.now().subtract(const Duration(days: 11));
    pickedDateEnd = DateTime.now();
    endDateController = TextEditingController(
      text: dateFormatMethod(
        dateTimeAsString: DateTime.now().toString(),
        pattern: "yyyy-MM-dd",
      ),
    );
  }

  late final TextEditingController startDateController;
  late final TextEditingController endDateController;
  late DateTime? pickedDateStart;
  late DateTime? pickedDateEnd;
  ScrollController scrollController = ScrollController();

  void refreshScreenFunction() {
    emit(state.copyWith(refreshScreen: state.refreshScreen + 1));
  }

  ///! this method is used to get the currency conversion
  void getCurrency() async {
    emit(state.copyWith(
      currencyStatus: ApiStatus.loading,
    ));
    var apiResult = await homeRepo.getCurrency(
      startDate: pickedDateStart != null
          ? dateFormatMethod(
              languageCode: "en",
              dateTimeAsString: pickedDateStart.toString(),
              pattern: "yyyy-MM-dd",
            )
          : dateFormatMethod(
              languageCode: "en",
              dateTimeAsString:
                  DateTime.now().subtract(const Duration(days: 11)).toString(),
              pattern: "yyyy-MM-dd",
            ),
      endDate: pickedDateEnd != null
          ? dateFormatMethod(
              languageCode: "en",
              dateTimeAsString: pickedDateEnd.toString(),
              pattern: "yyyy-MM-dd",
            )
          : dateFormatMethod(
              languageCode: "en",
              dateTimeAsString: DateTime.now().toString(),
              pattern: "yyyy-MM-dd",
            ),
      currentCurrency: "USD",
      targetCurrency: "EGP",
    );
    apiResult.when(success: (data) {
      showToast(text: "Success", color: AppColors.contentColorCyan);
      emit(
        state.copyWith(
          currencyStatus: ApiStatus.success,
          currencyModel: data,
        ),
      );
    }, failure: (error) {
      showToast(text: error, color: AppColors.contentColorCyan);
      emit(state.copyWith(currencyStatus: ApiStatus.failure));
    });
  }

  ///! this method is used to get the previous page of the currency conversion
  void previousPageFunction() async {
    pickedDateEnd = pickedDateStart;
    pickedDateStart =
        (pickedDateStart ?? DateTime.now()).subtract(const Duration(days: 11));
    endDateController.text = dateFormatMethod(
      dateTimeAsString: pickedDateEnd.toString(),
      pattern: isEnglish() ? "yyyy/MM/dd" : "dd - MM - yyyy",
      languageCode: isEnglish() ? "en" : "ar",
    );
    startDateController.text = dateFormatMethod(
      dateTimeAsString: pickedDateStart.toString(),
      pattern: isEnglish() ? "yyyy/MM/dd" : "dd - MM - yyyy",
      languageCode: isEnglish() ? "en" : "ar",
    );
    emit(state.copyWith(
      currencyStatus: ApiStatus.loading,
    ));
    var apiResult = await homeRepo.getCurrency(
      startDate: dateFormatMethod(
        languageCode: "en",
        dateTimeAsString: pickedDateStart.toString(),
        pattern: "yyyy-MM-dd",
      ),
      endDate: dateFormatMethod(
        languageCode: "en",
        dateTimeAsString: pickedDateEnd.toString(),
        pattern: "yyyy-MM-dd",
      ),
      currentCurrency: "USD",
      targetCurrency: "EGP",
    );
    apiResult.when(success: (data) {
      showToast(text: "Success", color: AppColors.contentColorCyan);
      emit(
        state.copyWith(
          currencyStatus: ApiStatus.success,
          currencyModel: data,
        ),
      );
    }, failure: (error) {
      showToast(text: error, color: AppColors.contentColorCyan);
      emit(state.copyWith(currencyStatus: ApiStatus.failure));
    });
  }

  ///! this method is used to get the next page of the currency conversion
  void nextPageFunction() async {
    if (dateFormatMethod(
            dateTimeAsString: pickedDateEnd.toString(),
            pattern: "yyyy-MM-dd",
            languageCode: "en") !=
        dateFormatMethod(
            dateTimeAsString: DateTime.now().toString(),
            pattern: "yyyy-MM-dd",
            languageCode: "en")) {
      pickedDateStart = pickedDateEnd;
      pickedDateEnd =
          (pickedDateEnd ?? DateTime.now()).add(const Duration(days: 11));
      if (pickedDateStart!.isAfter(DateTime.now())) {
        pickedDateStart = DateTime.now().subtract(const Duration(days: 11));
        pickedDateEnd = DateTime.now();
      } else if (pickedDateEnd!.isAfter(DateTime.now())) {
        pickedDateStart = DateTime.now().subtract(const Duration(days: 11));
        pickedDateEnd = DateTime.now();
      }
      endDateController.text = dateFormatMethod(
        dateTimeAsString: pickedDateEnd.toString(),
        pattern: isEnglish() ? "yyyy/MM/dd" : "dd - MM - yyyy",
        languageCode: isEnglish() ? "en" : "ar",
      );
      startDateController.text = dateFormatMethod(
        dateTimeAsString: pickedDateStart.toString(),
        pattern: isEnglish() ? "yyyy/MM/dd" : "dd - MM - yyyy",
        languageCode: isEnglish() ? "en" : "ar",
      );
      emit(state.copyWith(
        currencyStatus: ApiStatus.loading,
      ));
      var apiResult = await homeRepo.getCurrency(
        startDate: dateFormatMethod(
          languageCode: "en",
          dateTimeAsString: pickedDateStart.toString(),
          pattern: "yyyy-MM-dd",
        ),
        endDate: dateFormatMethod(
          languageCode: "en",
          dateTimeAsString: pickedDateEnd.toString(),
          pattern: "yyyy-MM-dd",
        ),
        currentCurrency: "USD",
        targetCurrency: "EGP",
      );
      apiResult.when(success: (data) {
        showToast(text: "Success", color: AppColors.contentColorCyan);
        emit(
          state.copyWith(
            currencyStatus: ApiStatus.success,
            currencyModel: data,
          ),
        );
      }, failure: (error) {
        showToast(text: error, color: AppColors.contentColorCyan);
        emit(state.copyWith(currencyStatus: ApiStatus.failure));
      });
    } else {
      showToast(
          text: isEnglish()
              ? "You are viewing the latest available date. No more dates are available."
              : "أنت تعرض آخر تاريخ متاح. لا توجد تواريخ أخرى متاحة.",
          color: AppColors.contentColorCyan);
    }
  }
}
