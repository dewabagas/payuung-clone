import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:payuung_clone/presentation/core/utils/extension/double_extension.dart';
import 'package:payuung_clone/presentation/profile/sections/profile_header_section.dart';
import 'package:payuung_clone/presentation/profile/widgets/button_profile.dart';
import 'package:payuung_clone/presentation/routes/app_route_paths.dart';
import 'package:payuung_clone/presentation/shared/pages/page_wrapper.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  final List<Map<String, dynamic>> profileItems = [
    {
      'icon': Icons.person_outline,
      'title': 'Informasi Pribadi',
      'route': RoutePaths.personalInformation,
    },
    {
      'icon': Icons.vpn_key_outlined,
      'title': 'Ubah Password',
      'route': RoutePaths.profile,
    },
    {
      'icon': Icons.contact_page_outlined,
      'title': 'Syarat & Ketentuan',
      'route': RoutePaths.profile,
    },
    {
      'icon': Icons.chat_bubble_outline,
      'title': 'Bantuan',
      'route': RoutePaths.profile,
    },
    {
      'icon': Icons.shield_outlined,
      'title': 'Kebijakan Privasi',
      'route': RoutePaths.profile,
    },
    {
      'icon': Icons.power_settings_new_rounded,
      'title': 'Log Out',
      'route': RoutePaths.profile,
    },
    {
      'icon': Icons.delete_outline_outlined,
      'title': 'Hapus Akun',
      'route': RoutePaths.profile,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarTitle: 'Profile',
      child: Column(
        children: [
          24.0.height,
          const ProfileHeaderSection(),
          24.0.height,
          ListView.builder(
              itemCount: profileItems.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final item = profileItems[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: ButtonProfile(
                    onTap: () => GoRouter.of(context).push(item['route']),
                    icon: item['icon'],
                    title: item['title'],
                  ),
                );
              })
        ],
      ),
    );
  }
}
