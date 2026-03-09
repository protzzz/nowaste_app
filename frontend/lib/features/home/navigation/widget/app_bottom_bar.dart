import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              12,
              0,
              12,
              bottomInset > 0 ? 8 : 12,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    height: 74,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.94),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.08,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: NavBarItem(
                            label: 'Fridge',
                            isSelected:
                                state == NavigationItem.fridge,
                            selectedSvgPath:
                                AppVectors.fridgeFilledIcon,
                            unselectedSvgPath: AppVectors.fridgeIcon,
                            widthSelected: 27,
                            widthUnselected: 27,
                            onTap:
                                () => context
                                    .read<NavigationCubit>()
                                    .setPage(NavigationItem.fridge),
                          ),
                        ),
                        Expanded(
                          child: NavBarItem(
                            label: 'Recipes',
                            isSelected:
                                state == NavigationItem.recipes,
                            selectedSvgPath:
                                AppVectors.recipesFilledIcon,
                            unselectedSvgPath:
                                AppVectors.recipesIcon2,
                            widthSelected: 28,
                            widthUnselected: 28,
                            onTap:
                                () => context
                                    .read<NavigationCubit>()
                                    .setPage(NavigationItem.recipes),
                          ),
                        ),
                        Expanded(
                          child: NavBarItem(
                            label: 'Alerts',
                            isSelected:
                                state ==
                                NavigationItem.notifications,
                            selectedSvgPath:
                                AppVectors.notificationFilledIcon,
                            unselectedSvgPath:
                                AppVectors.notificationIcon,
                            widthSelected: 26,
                            widthUnselected: 25,
                            onTap:
                                () => context
                                    .read<NavigationCubit>()
                                    .setPage(
                                      NavigationItem.notifications,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: NavBarItem(
                            label: 'Settings',
                            isSelected:
                                state == NavigationItem.settings,
                            selectedSvgPath:
                                AppVectors.settingsFilledIcon,
                            unselectedSvgPath:
                                AppVectors.settingsIcon,
                            widthSelected: 26,
                            widthUnselected: 25,
                            onTap:
                                () => context
                                    .read<NavigationCubit>()
                                    .setPage(
                                      NavigationItem.settings,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 74,
                    height: 74,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.94),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.08,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
