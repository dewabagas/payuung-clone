import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payuung_clone/presentation/core/styles/app_colors.dart';
import 'package:payuung_clone/presentation/shared/others/home_header.dart';

class PageDecorationTop extends StatelessWidget {
  final Widget child;
  final Widget? header;
  final PreferredSizeWidget? appBar;
  final String? appBarTitle;
  final List<Widget>? appBarActions;
  final Function? onBackPressed;
  final bool resizeToAvoidBottomInset;
  final bool hasBack;
  final Color? backgroundColor;

  const PageDecorationTop({
    super.key,
    required this.child,
    this.header,
    this.appBar,
    this.appBarTitle,
    this.appBarActions,
    this.resizeToAvoidBottomInset = true,
    this.hasBack = true,
    this.backgroundColor,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar ??
            (appBarTitle != null
                ? AppBar(
                    title: Text(appBarTitle!),
                    actions: appBarActions,
                    leading: hasBack
                        ? IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () =>
                                onBackPressed?.call() ?? Navigator.pop(context),
                          )
                        : null,
                  )
                : null),
        body: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primary,
          ),
          child: Column(
            children: [
              header ?? const HomeHeader(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
