import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/constants/assets.dart';
import 'package:payuung_clone/presentation/core/constants/styles.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/dashboard/sections/explore_wellness_section.dart';
import 'package:payuung_clone/presentation/dashboard/sections/financial_products_section.dart';
import 'package:payuung_clone/presentation/dashboard/sections/selected_category_section.dart';
import 'package:payuung_clone/presentation/dashboard/widgets/tab_options.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';
import 'package:payuung_clone/presentation/shared/pages/page_decoration_top.dart';

class PageDashboard extends StatefulWidget {
  final int bottomNavIndex;

  const PageDashboard({super.key, this.bottomNavIndex = 2});

  @override
  State<PageDashboard> createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  late PageController pageController;

  static const _minChildSize = 0.15;
  static const _maxChildSize = 0.5;
  final _sheetPosition = ValueNotifier<double>(_minChildSize);
  final iconList = [
    {
      'active': BottomBar.icAboutActive,
      'inactive': BottomBar.icAboutInactive,
      'title': 'Beranda',
      'route': RoutePaths.dashboard
    },
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'title': 'Beranda'},
    {'icon': Icons.search, 'title': 'Cari'},
    {'icon': Icons.shopping_cart, 'title': 'Keranjang'},
    {'icon': Icons.receipt_long, 'title': 'Daftar Transaksi'},
    {'icon': Icons.card_giftcard, 'title': 'Voucher Saya'},
    {'icon': Icons.location_on, 'title': 'Alamat Pengiriman'},
    {'icon': Icons.people, 'title': 'Daftar Teman'},
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SelectedCategorySection(),
                const ExploreWellnessSection(),
                100.0.height,
              ],
            ),
          ),
          // Tambahkan DraggableScrollableSheet di sini
          _buildDraggableCard(),
        ],
      ),
    );
  }

  Widget _buildDraggableCard() {
    return DraggableScrollableSheet(
      initialChildSize: _minChildSize,
      minChildSize: _minChildSize,
      maxChildSize: _maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return GestureDetector(
          onTap: () {
            if (_sheetPosition.value == _minChildSize) {
              _sheetPosition.value = _maxChildSize;
            } else {
              _sheetPosition.value = _minChildSize;
            }
          },
          onVerticalDragUpdate: (details) {
            _sheetPosition.value -= details.primaryDelta! / 1000;
            if (_sheetPosition.value < _minChildSize) {
              _sheetPosition.value = _minChildSize;
            }
            if (_sheetPosition.value > _maxChildSize) {
              _sheetPosition.value = _maxChildSize;
            }
          },
          onVerticalDragEnd: (details) {
            if (_sheetPosition.value < (_maxChildSize + _minChildSize) / 2) {
              _sheetPosition.value = _minChildSize;
            } else {
              _sheetPosition.value = _maxChildSize;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.zero,
            curve: Curves.easeInOut,
            height: MediaQuery.of(context).size.height * _sheetPosition.value,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                border: Border.all(color: AppColors.grey, width: 0.5)),
            child: GridView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'],
                        size: 36.sp,
                        color: AppColors.primary,
                      ),
                      2.0.height,
                      Text(
                        item['title'],
                        style: TextStyles.regular12,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
