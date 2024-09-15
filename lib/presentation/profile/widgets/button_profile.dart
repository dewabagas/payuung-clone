import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/shared/cards/card_general.dart';

class ButtonProfile extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final Function()? onTap;
  const ButtonProfile({super.key, this.icon, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CardGeneral(
        shadowOpacity: 0.1,
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                  color: AppColors.lightGrey3,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Icon(icon, color: AppColors.grey5, size: 22.w),
            ),
            16.0.width,
            Text('$title', style: TextStyles.regular12)
          ],
        ));
  }
}
