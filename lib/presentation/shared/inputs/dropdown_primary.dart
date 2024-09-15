import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart'; // Assuming you use this for responsive sizing

class DropdownPrimary extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String hintText;
  final String? title;
  final ValueChanged<String?>? onChanged;
  final bool isMandatory;

  const DropdownPrimary({
    Key? key,
    required this.value,
    required this.items,
    required this.hintText,
    this.title,
    this.onChanged,
    this.isMandatory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isMandatory
                ? Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: Text('*',
                        style: TextStyles.regular12
                            .copyWith(color: AppColors.red)),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Text(
                '$title',
                style: TextStyles.regular12.copyWith(
                  color: AppColors.lightText1,
                ),
              ),
            ),
            const SizedBox(),
          ],
        ),
        SizedBox(height: 8.h), // This replaces 8.0.height
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey4, width: 1.w),
            borderRadius: BorderRadius.circular(8.r), // Rounded corners
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              value: value,
              dropdownColor: AppColors.white,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyles.medium12.copyWith(
                      color: AppColors.lightText1,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              hint: Text(
                hintText,
                style: TextStyles.regular12.copyWith(
                  color: AppColors.lightText2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
