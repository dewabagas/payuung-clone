import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_clone/presentation/core/constants/assets.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';

class FinancialProductsSection extends StatefulWidget {
  const FinancialProductsSection({super.key});

  @override
  State<FinancialProductsSection> createState() =>
      _FinancialProductsSectionState();
}

class _FinancialProductsSectionState extends State<FinancialProductsSection> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': AppIcons.icUrun,
      'text': 'Urun',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icPembiayaanPorsiHaji,
      'text': 'Pembiayaan\nPorsi Haji',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icFinancialCheckUp,
      'text': 'Financial\nCheck Up',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icAsuransiMobil,
      'text': 'Asuransi Mobil',
      'route': RoutePaths.dashboard,
      'isActive': true
    },
    {
      'icon': AppIcons.icAsuransiProperti,
      'text': 'Asuransi\nProperti',
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
          Text('Produk Keuangan', style: TextStyles.bold14),
          6.0.height,
          GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 0.h,
            childAspectRatio: 1,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
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
                          width: 36.w,
                          height: 36.h,
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
