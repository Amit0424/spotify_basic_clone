import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar(
      {super.key,
      this.title,
      this.hideBack = false,
      this.action,
      this.backgroundColor});

  final Widget? title;
  final bool hideBack;
  final Widget? action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: backgroundColor ??
          (context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground),
      backgroundColor: backgroundColor ??
          (context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground),
      elevation: 0,
      title: title ?? const Text(''),
      actions: [action ?? const SizedBox.shrink()],
      centerTitle: true,
      leading: hideBack
          ? null
          : IconButton(
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
