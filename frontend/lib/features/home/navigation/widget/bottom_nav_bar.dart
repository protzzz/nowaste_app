import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/configs/app_vectors.dart';
import 'package:nowaste_app/features/home/navigation/cubit/navigation_cubit.dart';
import 'package:nowaste_app/features/home/navigation/widget/nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationItem>(
      builder: (context, state) {
        // final selectedColor = AppColors.lightGreen;
        // final unselectedColor = Colors.grey.shade600;

        return SafeArea(
          bottom: false,
          minimum: EdgeInsets.only(top: 10),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            color: Colors.white,
            child: SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Fridge
                  NavBarItem(
                    label: 'Fridge',
                    isSelected: state == NavigationItem.fridge,
                    selectedSvgPath: AppVectors.fridgeFilledIcon,
                    unselectedSvgPath: AppVectors.fridgeIcon,
                    widthSelected: 27,
                    widthUnselected: 27,
                    onTap:
                        () => context
                            .read<NavigationCubit>()
                            .setPage(NavigationItem.fridge),
                  ),

                  // Recipes
                  NavBarItem(
                    label: 'Recipes',
                    isSelected: state == NavigationItem.recipes,
                    selectedSvgPath: AppVectors.recipesFilledIcon,
                    unselectedSvgPath: AppVectors.recipesIcon2,
                    widthSelected: 28,
                    widthUnselected: 28,
                    onTap:
                        () => context
                            .read<NavigationCubit>()
                            .setPage(NavigationItem.recipes),
                  ),

                  const SizedBox(width: 25),

                  // Notifications
                  NavBarItem(
                    label: 'Alerts',
                    isSelected:
                        state == NavigationItem.notifications,
                    selectedSvgPath:
                        AppVectors.notificationFilledIcon,
                    unselectedSvgPath: AppVectors.notificationIcon,
                    widthSelected: 26,
                    widthUnselected: 25,
                    onTap:
                        () => context
                            .read<NavigationCubit>()
                            .setPage(NavigationItem.notifications),
                  ),

                  // Settings
                  NavBarItem(
                    label: 'Settings',
                    isSelected: state == NavigationItem.settings,
                    selectedSvgPath: AppVectors.settingsFilledIcon,
                    unselectedSvgPath: AppVectors.settingsIcon,
                    widthSelected: 26,
                    widthUnselected: 25,
                    onTap:
                        () => context
                            .read<NavigationCubit>()
                            .setPage(NavigationItem.settings),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
