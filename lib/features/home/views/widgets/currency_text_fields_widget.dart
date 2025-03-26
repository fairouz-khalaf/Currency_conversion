import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:currency_watch/core/helpers/main_functions.dart';
import 'package:currency_watch/features/home/logic/home_cubit.dart';
import 'package:currency_watch/features/home/logic/home_state.dart';
import 'package:currency_watch/features/home/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyTextFieldsWidget extends StatelessWidget {
  const CurrencyTextFieldsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isEng = isEnglish();
        return Row(
          children: [
            Expanded(
              child: CustomDateTextField(
                controller: context.read<HomeCubit>().startDateController,
                englishLabel: 'start date',
                arabicLabel: 'تاريخ البداية',
                englishHint: 'Enter start date',
                arabicHint: 'ادخل تاريخ البداية',
                isEnglish: isEng,
                onTap: () => _showDatePicker(context),
              ),
            ),
            16.w.pw,
            Expanded(
              child: CustomDateTextField(
                controller: context.read<HomeCubit>().endDateController,
                englishLabel: 'end date',
                arabicLabel: 'تاريخ النهاية',
                englishHint: 'Enter end date',
                arabicHint: 'ادخل تاريخ النهاية',
                isEnglish: isEng,
                onTap: () => _showDatePicker(context),
              ),
            ),
          ],
        );
      },
    );
  }

  ///! this method is used to show the date picker
  void _showDatePicker(BuildContext context) {
    showDateRangePicker(
      context: context,
      locale: isEnglish() ? const Locale("en") : const Locale("ar"),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null && context.mounted) {
        final cubit = context.read<HomeCubit>();
        cubit.pickedDateStart = value.start;
        cubit.pickedDateEnd = value.end;

        final pattern = isEnglish() ? "yyyy/MM/dd" : "dd - MM - yyyy";

        cubit.startDateController.text = dateFormatMethod(
          dateTimeAsString: value.start.toString(),
          pattern: pattern,
        );

        cubit.endDateController.text = dateFormatMethod(
          dateTimeAsString: value.end.toString(),
          pattern: pattern,
        );

        cubit.getCurrency();
      }
    });
  }
}
