import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';
import 'package:payuung_clone/presentation/shared/others/image_circle.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      child: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo',
                    style:
                        TextStyles.regular14.copyWith(color: AppColors.white),
                  ),
                  Text('Bagas',
                      style: TextStyles.semibold14
                          .copyWith(color: AppColors.white))
                ],
              ),
              Row(
                children: [
                  Icon(Icons.notifications_none,
                      size: 30.w, color: AppColors.white),
                  10.0.width,
                  GestureDetector(
                    onTap: () => GoRouter.of(context).push(RoutePaths.profile),
                    child: ImageCircle(
                        height: 40.w,
                        width: 40.w,
                        image:
                            'https://static.vecteezy.com/system/resources/thumbnails/005/129/844/small_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
