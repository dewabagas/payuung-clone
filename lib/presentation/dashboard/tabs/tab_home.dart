import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payuung_clone/presentation/core/constants/assets.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/dashboard/sections/financial_products_section.dart';
import 'package:payuung_clone/presentation/dashboard/sections/selected_category_section.dart';
import 'package:payuung_clone/presentation/dashboard/widgets/tab_options.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';
import 'package:payuung_clone/presentation/shared/pages/page_decoration_top.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        24.0.height,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TabOptions(
            selectedIndex: selectedIndex,
            onValueChanged: (i) {
              pageController.animateToPage(
                i,
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease,
              );
              setState(() {
                selectedIndex = i;
              });
            },
          ),
        ),
        16.0.height,
        const Divider(color: AppColors.primary, thickness: 0.2),
        const FinancialProductsSection(),
        const SelectedCategorySection()
      ]),
    );
  }
}
