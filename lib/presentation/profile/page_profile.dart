import 'package:flutter/widgets.dart';
import 'package:payuung_clone/presentation/shared/pages/page_wrapper.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarTitle: 'Profile',
      child: Column(),
    );
  }
}
