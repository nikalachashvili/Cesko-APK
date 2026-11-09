import 'package:flutter/material.dart';
import 'package:voters/app/widgets/bottom_nav_item.dart';
import 'package:voters/core/constants/app_images.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Bottom bar with the home, game and schedule tabs.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    Color iconColor(int index) =>
        currentIndex == index ? AppColors.green : AppColors.navInactive;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Row(
            children: [
              BottomNavItem(
                label: 'მთავარი',
                selected: currentIndex == 0,
                onTap: () => onTap(0),
                child: Icon(
                  Icons.account_circle,
                  size: 28,
                  color: iconColor(0),
                ),
              ),
              BottomNavItem(
                label: 'თამაში',
                selected: currentIndex == 1,
                onTap: () => onTap(1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 46,
                  height: 46,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == 1
                        ? AppColors.green
                        : Colors.transparent,
                  ),
                  child: Image.asset(AppImages.votersPair, fit: BoxFit.contain),
                ),
              ),
              BottomNavItem(
                label: 'ღონისძიებათა გრაფიკი',
                selected: currentIndex == 2,
                onTap: () => onTap(2),
                child: Icon(Icons.event, size: 28, color: iconColor(2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
