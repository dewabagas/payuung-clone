import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_clone/presentation/core/constants/assets.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';

class SelectedCategorySection extends StatefulWidget {
  const SelectedCategorySection({super.key});

  @override
  State<SelectedCategorySection> createState() =>
      _SelectedCategorySectionState();
}

class _SelectedCategorySectionState extends State<SelectedCategorySection> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': AppIcons.icHobi,
      'text': 'Hobi',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icMerchandise,
      'text': 'Merchandise',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icGayaHidupSehat,
      'text': 'Gaya Hidup\nSehat',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icKonselingRohani,
      'text': 'Konseling &\nRohani',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icSelfDevelopment,
      'text': 'Self\nDevelopment',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icPerencanaanKeuangan,
      'text': 'Perencanaan\nKeuangan',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icKonsultasiMedis,
      'text': 'Konsultasi\nMedis',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icLihatSemua,
      'text': 'Lihat\nSemua',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kategori Pilihan', style: TextStyles.bold14),
              Container(
                child: Row(
                  children: [
                    Text('Wishlist', style: TextStyles.regular12),
                    4.0.width,
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Text('0'),
                    )
                  ],
                ),
              )
            ],
          ),
          6.0.height,
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0.h,
            childAspectRatio: 1,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: menuItems.map((item) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {},
                      child: Center(
                        child: SvgPicture.asset(
                          item['icon'],
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                    Text(item['text'],
                        textAlign: TextAlign.center,
                        style: TextStyles.regular10),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
