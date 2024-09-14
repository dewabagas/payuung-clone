import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';

AppBar appbarLabel(
    {Function? onBackPressed,
    String? title,
    List<Widget>? actions,
    bool hasBack = true}) {
  return AppBar(
    leading: hasBack
        ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onBackPressed as void Function()?)
        : const SizedBox.shrink(),
    title: Text(
      title ?? '',
      style: TextStyles.semibold14.copyWith(color: AppColors.white),
    ),
    centerTitle: true,
    backgroundColor: AppColors.secondary,
    actions: actions,
    elevation: 0,
  );
}

AppBar appbarLabelAlternative(
    {Function? onBackPressed,
    String? title,
    List<Widget>? actions,
    Color? backgroundColor,
    Color? titleColor,
    Color? borderColor,
    Color? iconColor,
    bool hasBack = true}) {
  return AppBar(
    leading: hasBack
        ? IconButton(
            onPressed: onBackPressed as void Function()?,
            icon: SizedBox(
              width: 32.w,
              height: 32.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border:
                      Border.all(color: borderColor ?? AppColors.strokeLight),
                ),
                child: Icon(
                  Icons.chevron_left,
                  color: iconColor ?? AppColors.darkText2,
                ),
              ),
            ),
          )
        : const SizedBox.shrink(),
    title: Text(
      title ?? '',
      style: TextStyles.medium14
          .copyWith(color: titleColor ?? AppColors.strokeDark),
    ),
    centerTitle: true,
    backgroundColor: backgroundColor ?? AppColors.bgLight,
    actions: actions,
    elevation: 0,
  );
}
