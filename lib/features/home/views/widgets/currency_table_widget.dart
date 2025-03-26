import 'package:currency_watch/core/helpers/enums.dart';
import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:currency_watch/core/helpers/main_functions.dart';
import 'package:currency_watch/core/widgets/appWidget/app_shimmer.dart';
import 'package:currency_watch/features/home/logic/home_cubit.dart';
import 'package:currency_watch/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyTableWidget extends StatelessWidget {
  const CurrencyTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            16.w.pw,
            DataTable(
              headingRowColor: WidgetStateColor.resolveWith(
                (states) => Colors.grey.shade300,
              ),
              border: TableBorder.all(color: Colors.grey, width: 1),
              columns:  [
                DataColumn(label: Text(isEnglish()?'Date':"تاريخ")),
                DataColumn(label: Text(isEnglish()?'From':"من")),
                DataColumn(label: Text(isEnglish()?'To':"الى")),
                DataColumn(label: Text(isEnglish()?'Price':"السعر")),
              ],
              rows: context.watch<HomeCubit>().state.currencyStatus ==
                      ApiStatus.success
                  ? List.generate(
                      state.currencyModel!.quotes.length,
                      (index) {
                        var entry =
                            state.currencyModel!.quotes.entries.toList()[index];
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(dateFormatMethod(
                                  dateTimeAsString: entry.key,
                                  pattern: 'dd  MMM yyyy  EEE')),
                            ),
                            const DataCell(
                              Text('USD'),
                            ),
                            const DataCell(
                              Text('EGP'),
                            ),
                            DataCell(
                              Text(
                                isEnglish()
                                    ? entry
                                        .value.currencyRates.entries.first.value
                                        .toString()
                                    : convertToArabicNumerals(entry.value
                                            .currencyRates.entries.first.value)
                                        .toString(),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : List.generate(
                      5,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            AppShimmer(
                              width: 100.w,
                              height: 40.h,
                            ).addAllPadding(5),
                          ),
                          const DataCell(
                            Text('USD'),
                          ),
                          const DataCell(
                            Text('EGP'),
                          ),
                          DataCell(
                            AppShimmer(
                              width: 100.w,
                              height: 40.h,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            16.w.pw,
          ],
        );
      },
    );
  }
}
