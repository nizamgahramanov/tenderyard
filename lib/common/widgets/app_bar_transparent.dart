import 'package:flutter/material.dart';

class AppBarTransparentWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarTransparentWidget({
    super.key,
    required this.backgroundColor,
    this.title,
    this.height = 52,
    this.automaticallyImplyLeading = false,
    this.customBackButton,
  });
  final Color backgroundColor;
  final double height;
  final Widget? title;
  final bool automaticallyImplyLeading;
  final VoidCallback? customBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor,
        title: title,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        leading: customBackButton!=null
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => customBackButton!(),
                  );
                },
              )
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
