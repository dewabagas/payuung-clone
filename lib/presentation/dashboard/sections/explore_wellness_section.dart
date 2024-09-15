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

class ExploreWellnessSection extends StatefulWidget {
  const ExploreWellnessSection({super.key});

  @override
  _ExploreWellnessSectionState createState() => _ExploreWellnessSectionState();
}

class _ExploreWellnessSectionState extends State<ExploreWellnessSection> {
  String _selectedFilter = 'Terpopuler'; // Default selected option
  bool _isDropdownOpen = false; // Track whether the dropdown is open or not

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WellnessVouchersCubit>(
      create: (context) => getIt<WellnessVouchersCubit>()..loadVouchers(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedFilter,
                    padding: EdgeInsets.zero,
                    underline: const SizedBox(), // Hapus garis bawah
                    icon: Icon(Icons.keyboard_arrow_down, size: 20.w),
                    isDense: true, // Menjadikan dropdown lebih ringkas
                    onTap: () {
                      setState(() {
                        _isDropdownOpen = true;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value!;
                        _isDropdownOpen =
                            false; // Tutup dropdown setelah memilih
                      });
                    },
                    items: [
                      _buildDropdownItem('Terpopuler'),
                      _buildDropdownItem('A to Z'),
                      _buildDropdownItem('Z to A'),
                      _buildDropdownItem('Harga Tertinggi'),
                      _buildDropdownItem('Harga Terendah'),
                    ],
                  ),
                ),
              ],
            ),
            16.0.height,
            BlocBuilder<WellnessVouchersCubit, WellnessVouchersState>(
              builder: (context, state) {
                return state.map(
                  initial: (value) => const SizedBox(),
                  loadInProgress: (value) => const SizedBox(),
                  loadSuccess: (value) {
                    log('loadSuccess ${value.vouchers}');

                    // Apply filters based on the selected filter
                    var filteredVouchers = [...value.vouchers];
                    switch (_selectedFilter) {
                      case 'A to Z':
                        filteredVouchers.sort(
                            (a, b) => a.voucherName!.compareTo(b.voucherName!));
                        break;
                      case 'Z to A':
                        filteredVouchers.sort(
                            (a, b) => b.voucherName!.compareTo(a.voucherName!));
                        break;
                      case 'Harga Tertinggi':
                        filteredVouchers
                            .sort((a, b) => b.price!.compareTo(a.price!));
                        break;
                      case 'Harga Terendah':
                        filteredVouchers
                            .sort((a, b) => a.price!.compareTo(b.price!));
                        break;
                      case 'Terpopuler':
                      default:
                        // Assuming "Terpopuler" is the default sorting or popularity-based sorting
                        break;
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredVouchers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.w,
                        mainAxisSpacing: 0.h,
                        childAspectRatio: 0.8,
                      ),
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = filteredVouchers[index];
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      topRight: Radius.circular(8.r)),
                                  child: CachedNetworkImage(
                                    imageUrl: '${data.imageUrl}',
                                    height: 80.h,
                                    placeholder: (context, url) =>
                                        ShimmerPrimary(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      AppImages.imgNoImage,
                                      height: 80.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              16.0.height,
                              Text('${data.voucherName}',
                                  style: TextStyles.regular12),
                              10.0.height,
                              Text('Rp. ${formatRupiah(data.price!.toInt())}',
                                  style: TextStyles.regular12),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loadFailure: (value) => const SizedBox(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Row(
        children: [
          if (_isDropdownOpen &&
              _selectedFilter ==
                  value) // Dot indicator only when dropdown is open and option is selected
            Container(
              width: 6.w,
              height: 6.h,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          if (_isDropdownOpen && _selectedFilter == value)
            8.0.width, // Spacer between dot and text
          Text(value, style: TextStyles.regular12),
        ],
      ),
    );
  }
}
