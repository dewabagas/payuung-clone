import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';

class TabOptions extends StatelessWidget {
  final int selectedIndex;
  final Function? onTap;
  final void Function(int)? onValueChanged;

  const TabOptions({
    required this.selectedIndex,
    this.onTap,
    this.onValueChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      initialValue: selectedIndex,
      isStretch: true,
      height: 25.h,
      padding: 0,
      innerPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(30.r),
      ),
      thumbDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r), color: AppColors.primary),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInToLinear,
      children: {
        0: Text(
          'Payuung Pribadi',
          style: TextStyles.regular12.copyWith(
              color: selectedIndex == 0 ? AppColors.white : AppColors.grey),
        ),
        1: Text(
          'Payuung Karyawan',
          style: TextStyles.regular12.copyWith(
              color: selectedIndex == 1 ? AppColors.white : AppColors.grey),
        ),
      },
      onValueChanged: onValueChanged!,
    );
  }
}
