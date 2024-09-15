import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';

class InitialsAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final Color backgroundColor;

  const InitialsAvatar({
    super.key,
    required this.name,
    this.radius = 25.0,
    this.backgroundColor = AppColors.grey3,
  });

  String getInitials(String name) {
    List<String> nameParts = name.split(" ");
    String initials = nameParts.length > 1
        ? "${nameParts[0][0]}${nameParts[1][0]}"
        : nameParts[0][0];
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    String initials = getInitials(name);
    return CircleAvatar(
      radius: radius.r,
      backgroundColor: backgroundColor,
      child: Text(
        initials,
        style: TextStyles.semibold16.copyWith(color: AppColors.white),
      ),
    );
  }
}
