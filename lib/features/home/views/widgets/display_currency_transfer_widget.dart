import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:currency_watch/core/helpers/main_functions.dart';
import 'package:currency_watch/core/theme/app_colors.dart' show AppColors;
import 'package:currency_watch/core/widgets/appWidget/app_text.dart';
import 'package:currency_watch/features/home/logic/home_cubit.dart';
import 'package:currency_watch/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCurrencyTransferWidget extends StatelessWidget {
  const DisplayCurrencyTransferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return AppText(
                    text: isEnglish() ? "Current Currency" : "العملة الحالية",
                    textColor: AppColors.blackColor,
                    textSize: 16.sp,
                    textWeight: FontWeight.w600,
                  );
                },
              ),
              4.h.ph,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.blueColor),
                ),
                child: AppText(
                  text: isEnglish() ? "USD" : "دولار امريكي",
                  textColor: AppColors.blueColor,
                  textSize: 18.sp,
                  textWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return AppText(
                    text: isEnglish() ? "Target Currency" : "العملة المستهدفة",
                    textColor: AppColors.blackColor,
                    textSize: 16.sp,
                    textWeight: FontWeight.w600,
                  );
                },
              ),
              4.h.ph,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.blueColor),
                ),
                child: AppText(
                  text: isEnglish() ? "EGP" : "جنيه مصري",
                  textColor: AppColors.blueColor,
                  textSize: 18.sp,
                  textWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
