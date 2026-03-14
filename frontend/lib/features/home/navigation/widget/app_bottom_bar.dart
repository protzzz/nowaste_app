import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/core/configs/app_icons.dart';
import 'package:nowaste_app/core/configs/app_vectors.dart';
import 'package:nowaste_app/features/home/navigation/cubit/navigation_cubit.dart';
import 'package:nowaste_app/features/home/navigation/widget/nav_bar_item.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationItem>(
      builder: (context, state) {
        final bottomInset = MediaQuery.of(context).padding.bottom;

        final selectedMainColor = AppColors.lightGreen;
        final inactiveColor = AppColors.darkBackground;
        // final selectedBackgroundColor = selectedMainColor.withValues(alpha: 0.12);
        // final selectedBorderColor = selectedMainColor.withValues(alpha: 0.18);

        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              12,
              0,
              12,
              bottomInset > 0 ? 3 : 6,
              // 0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // height: 62,
                    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.88),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Fridge Nav Bar Item
                        NavBarItem(
                          label: 'Fridge',

                          isSelected: state == NavigationItem.fridge,
                          // iconPath: AppVectors.fridgeIcon,
                          iconPath: AppVectors.fridgeFilledIcon,
                          width: 24,
                          color: state == NavigationItem.fridge ? selectedMainColor : inactiveColor,

                          onTap:
                              () => context.read<NavigationCubit>().setPage(NavigationItem.fridge),
                        ),

                        // Recipes Nav Bar Item
                        NavBarItem(
                          label: 'Recipes',

                          isSelected: state == NavigationItem.recipes,
                          // iconPath: AppIcons.cooking,
                          iconPath: AppIcons.cookingFilled,
                          // iconPath: AppIcons.chef,
                          width: 24,
                          color:
                              state == NavigationItem.recipes ? selectedMainColor : inactiveColor,
                          onTap:
                              () => context.read<NavigationCubit>().setPage(NavigationItem.recipes),
                        ),

                        // Alerts Nav Bar Item
                        NavBarItem(
                          label: 'Alerts',

                          isSelected: state == NavigationItem.notifications,
                          // iconPath: AppIcons.alert,
                          iconPath: AppIcons.alertFilled,
                          width: 24,
                          color:
                              state == NavigationItem.notifications
                                  ? selectedMainColor
                                  : inactiveColor,
                          onTap:
                              () => context.read<NavigationCubit>().setPage(
                                NavigationItem.notifications,
                              ),
                        ),

                        // Settings Nav Bar Item
                        NavBarItem(
                          label: 'Settings',

                          isSelected: state == NavigationItem.settings,
                          // iconPath: AppIcons.settings,
                          iconPath: AppIcons.settingsFilled,
                          width: 24,
                          color:
                              state == NavigationItem.settings ? selectedMainColor : inactiveColor,
                          onTap:
                              () =>
                                  context.read<NavigationCubit>().setPage(NavigationItem.settings),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(width: 12),

                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     width: 60,
                //     height: 74,
                //     decoration: BoxDecoration(
                //       color: Colors.white.withValues(alpha: 0.94),
                //       shape: BoxShape.circle,
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.black.withValues(
                //             alpha: 0.08,
                //           ),
                //           blurRadius: 24,
                //           offset: const Offset(0, 8),
                //         ),
                //       ],
                //     ),
                //     child: const Center(
                //       child: Icon(
                //         Icons.add,
                //         size: 30,
                //         color: Colors.black87,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
