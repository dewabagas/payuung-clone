import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:payuung_clone/application/greetings_cubit/greetings_cubit.dart';
import 'package:payuung_clone/injection.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';
import 'package:payuung_clone/presentation/shared/loaders/shimmer_primary.dart';
import 'package:payuung_clone/presentation/shared/others/image_circle.dart';
import 'package:payuung_clone/presentation/shared/others/initials_avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GreetingsCubit>(
      create: (context) => getIt<GreetingsCubit>()..getGreeting(),
      child: Container(
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
                    BlocBuilder<GreetingsCubit, GreetingsState>(
                      builder: (context, state) {
                        return state.map(
                            initial: (value) =>
                                ShimmerPrimary(child: greetingsDummy()),
                            loadInProgress: (value) =>
                                ShimmerPrimary(child: greetingsDummy()),
                            loadSuccess: (value) {
                              return Text(value.greeting,
                                  style: TextStyles.regular14
                                      .copyWith(color: AppColors.white));
                            },
                            loadFailure: (value) {
                              return greetingsDummy();
                            });
                      },
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
                        onTap: () =>
                            GoRouter.of(context).push(RoutePaths.profile),
                        child: InitialsAvatar(
                            radius: 20.r, name: 'Bagas Dewangono')),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  greetingsDummy() {
    return Text('Selamat Pagi,',
        style: TextStyles.semibold12.copyWith(color: AppColors.white));
  }
}
