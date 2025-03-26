import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:currency_watch/core/helpers/main_functions.dart';
import 'package:currency_watch/core/helpers/shared_preferences.dart';
import 'package:currency_watch/core/theme/app_colors.dart' show AppColors;
import 'package:currency_watch/core/widgets/appWidget/app_button.dart'
    show AppButton;
import 'package:currency_watch/core/widgets/appWidget/app_text.dart';
import 'package:currency_watch/features/home/logic/home_cubit.dart';
import 'package:currency_watch/features/home/logic/home_state.dart';
import 'package:currency_watch/features/home/views/widgets/currency_table_widget.dart';
import 'package:currency_watch/features/home/views/widgets/currency_text_fields_widget.dart';
import 'package:currency_watch/features/home/views/widgets/display_currency_transfer_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return AppText(
              text: isEnglish() ? 'Currency Conversion' : "تحويل العملات",
              textColor: AppColors.blackColor,
              textSize: 20.sp,
              textWeight: FontWeight.w400,
            );
          },
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              if (SharedPrefHelper.getLanguage() == "ar") {
                SharedPrefHelper.setLanguage("en");
                EasyLocalization.of(context)!.setLocale(const Locale("en"));
              } else {
                SharedPrefHelper.setLanguage("ar");
                EasyLocalization.of(context)!.setLocale(const Locale("ar"));
              }
              context.read<HomeCubit>().refreshScreenFunction();
              context.read<HomeCubit>().scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);

            },
            icon: const Icon(Icons.language_rounded),
            color: AppColors.mainAppColor,
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: const CurrencyTextFieldsWidget().addAllPadding(16),
              ),
              SliverToBoxAdapter(
                child: const DisplayCurrencyTransferWidget().addAllPadding(16),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  controller: context.watch<HomeCubit>().scrollController,
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: const CurrencyTableWidget(),
                ),
              ),
              SliverToBoxAdapter(
                child: 16.h.ph,
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return AppButton(
                            background: AppColors.whiteColor,
                            borderColor: AppColors.blueColor,
                            radius: 16.sp,
                            width: double.infinity,
                            height: 56.h,
                            onTap: () {
                              context.read<HomeCubit>().previousPageFunction();
                            },
                            title: isEnglish() ? "Previous" : "السابق",
                            fontSize: 16.sp,
                            textColor: AppColors.blueColor,
                            fontWeight: FontWeight.w600,
                          );
                        },
                      ),
                    ),
                    16.w.pw,
                    Expanded(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return AppButton(
                            background: AppColors.blueColor,
                            borderColor: AppColors.blueColor,
                            radius: 16.sp,
                            width: double.infinity,
                            height: 56.h,
                            onTap: () {
                              context.read<HomeCubit>().nextPageFunction();
                            },
                            title: isEnglish() ? "Next" : "التالي",
                            fontSize: 16.sp,
                            textColor: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          );
                        },
                      ),
                    ),
                  ],
                ).addAllPadding(16),
              ),
            ],
          );
        },
      ),
    );
  }
}
