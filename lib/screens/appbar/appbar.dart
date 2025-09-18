// appbar.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_book/models/character.dart';
import 'package:life_book/screens/home/home.dart'; // Ensure Home can receive player
import 'package:life_book/screens/menu/menu_screen.dart'; // Ensure MenuScreen can receive player
import 'package:life_book/theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  // 1. Add player to CustomAppBar
  final Character player;
  // 2. Add an optional callback for menu state changes if a parent needs to react
  final ValueChanged<bool>? onMenuToggle;

  const CustomAppBar({
    super.key,
    required this.player, // Make player required
    this.onMenuToggle,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(75.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  // menuClicked state should reflect whether the menu *is currently shown*
  // If MenuScreen is a separate navigation route, this state might not be directly relevant
  // for the AppBar itself, but rather for its visual cue (menu icon vs. close icon).
  // Let's assume it controls the icon and if we are navigating to MenuScreen.
  bool _isMenuOpen = false; // Renamed for clarity

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.redColor,
      toolbarHeight: 75.h,
      leading: GestureDetector(
        onTap: () {
          setState(() {
            _isMenuOpen = !_isMenuOpen; // Toggle the internal state

            // Notify parent if callback is provided (e.g., to switch body content)
            widget.onMenuToggle?.call(_isMenuOpen);
          });

          // Navigation logic:
          // If the menu is now "open", navigate to MenuScreen.
          // If the menu is now "closed", it means we were on MenuScreen and want to go back.
          if (_isMenuOpen) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(player: widget.player),
              ),
            ).then((_) {
              // This `.then` block executes when MenuScreen is popped.
              // We reset _isMenuOpen here because we are returning to the previous screen.
              if (mounted) {
                setState(() {
                  _isMenuOpen = false;
                });
              }
            });
          } else {
            // If _isMenuOpen became false, it implies we want to go back from MenuScreen.
            // This case should ideally be handled by MenuScreen's own back button or logic,
            // or by simply popping the current route if this AppBar is used on MenuScreen.
            // For now, if we are currently on MenuScreen and tap the icon to close, we pop.
            if (Navigator.of(context).canPop()) {
              // Only pop if there's a route to pop, e.g., if we were on MenuScreen
              Navigator.of(context).pop();
            }
          }
        },
        child: Container(
          width: 30.w,
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          margin: EdgeInsets.only(top: 7.h),
          child:
              _isMenuOpen // Use the internal state for the icon
              ? SvgPicture.asset("assets/icons/cancel.svg", fit: BoxFit.contain)
              : Image.asset("assets/images/menu.png", fit: BoxFit.contain),
        ),
      ),
      centerTitle: _isMenuOpen ? true : false,
      titleSpacing: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            MainAxisAlignment.start, // Keep as start to align title
        crossAxisAlignment: CrossAxisAlignment.center,
        // Removed 'spacing' as it's not a standard Row property
        children: [
          // If menu is open, show "MAIN MENU"
          if (_isMenuOpen)
            Text(
              'MAIN MENU',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              ),
            )
          else // If menu is closed, show "LifeBook" logo and title
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38.w,
                  height: 38.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(), // Added const
                  child: SvgPicture.asset("assets/icons/logo.svg"),
                ),
                SizedBox(width: 8.w),
                Text(
                  'LifeBook',
                  style: TextStyle(
                    color: AppColors
                        .yellowColor, // Assuming AppColors.yellowColor is defined
                    fontSize: 28.sp,
                    fontFamily: GoogleFonts.jaro().fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
