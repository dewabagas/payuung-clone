import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/application/wellness_vouchers_cubit/wellness_vouchers_cubit.dart';
import 'package:payuung_clone/injection.dart';
import 'package:payuung_clone/presentation/core/constants/assets.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/common_utils.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/shared/loaders/shimmer_primary.dart';

class ExploreWellnessSection extends StatelessWidget {
  const ExploreWellnessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WellnessVouchersCubit>(
      create: (context) => getIt<WellnessVouchersCubit>()..loadVouchers(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kategori Pilihan', style: TextStyles.bold14),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Row(
                  children: [
                    Text('Wishlist', style: TextStyles.regular12),
                    4.0.width,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.primary),
                      child: Text('0',
                          style: TextStyles.regular10
                              .copyWith(color: AppColors.white)),
                    )
                  ],
                ),
              ),
            ],
          ),
          6.0.height,
          BlocBuilder<WellnessVouchersCubit, WellnessVouchersState>(
            builder: (context, state) {
              return state.map(
                  initial: (value) => const SizedBox(),
                  loadInProgress: (value) => const SizedBox(),
                  loadSuccess: (value) {
                    log('loadSuccess ${value.vouchers}');
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: value.vouchers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.8,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = value.vouchers[index];
                        return Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r)),
                                child: CachedNetworkImage(
                                  imageUrl: '${data.imageUrl}',
                                  height: 100.h,
                                  placeholder: (context, url) =>
                                      ShimmerPrimary(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppImages.imgNoImage,
                                    height: 100.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text('${data.voucherName}',
                                  style: TextStyles.regular12),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loadFailure: (value) => const SizedBox());
            },
          )
        ],
      ),
    );
  }
}
