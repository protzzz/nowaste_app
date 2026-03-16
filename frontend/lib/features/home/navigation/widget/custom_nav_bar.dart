import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/features/home/navigation/widget/nav_bar_item.dart';

import '../../../../core/configs/app_icons.dart';
import '../../../../core/configs/app_vectors.dart';
import '../cubit/navigation_cubit.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  bool _showAdd = true;

  @override
  Widget build(BuildContext context) {
    // final selectedMainColor = Theme.of(context).colorScheme.primary;
    // final inactiveColor = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);

    return BlocBuilder<NavigationCubit, NavigationItem>(
      builder: (context, state) {
        final selectedMainColor = AppColors.lightGreen;
        final inactiveColor = AppColors.darkBackground;

        final bottomInset = MediaQuery.of(context).padding.bottom;
        // const accentColor = Color(0xFF34C759);
        // final inactiveColor = Colors.black.withValues(alpha: 0.58);
        // final selectedBackgroundColor = accentColor.withValues(alpha: 0.12);
        // final selectedBorderColor = accentColor.withValues(alpha: 0.18);

        // final selectedBackgroundColor = const Color.fromARGB(239, 238, 238, 238);
        final selectedBackgroundColor = const Color.fromARGB(
          176,
          238,
          238,
          238,
        ).withValues(alpha: 0.8);

        final selectedIndex = switch (state) {
          NavigationItem.fridge => 0,
          NavigationItem.recipes => 1,
          NavigationItem.notifications => 2,
          NavigationItem.settings => 3,
          NavigationItem.addProduct => -1,
          NavigationItem.search => -1,
        };

        final isAddProductSelected = state == NavigationItem.addProduct;
        final isSearchSelected = state == NavigationItem.search;

        final isFloatButtonSelected = isAddProductSelected || isSearchSelected;

        if (_showAdd && isSearchSelected) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _showAdd = false;
              });
            }
          });
        } else if (!_showAdd && isAddProductSelected) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _showAdd = true;
              });
            }
          });
        }

        return Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              12,
              0,
              12,
              bottomInset > 0 ? 3 : 6,
              // 0,
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // height: 64,
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
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
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final itemWidth = constraints.maxWidth / 4;

                          return SizedBox(
                            // height: 56,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 260),
                                  curve: Curves.easeOutCubic,
                                  left:
                                      (isFloatButtonSelected ? 0 : selectedIndex * itemWidth)
                                          .toDouble(),
                                  top: 0,
                                  child: AnimatedOpacity(
                                    duration: Duration(milliseconds: 180),
                                    curve: Curves.easeOut,
                                    opacity: isFloatButtonSelected ? 0 : 1,
                                    child: Container(
                                      width: itemWidth,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: selectedBackgroundColor,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    // Fridge Nav Bar Item
                                    NavBarItem(
                                      label: 'Fridge',

                                      isSelected: state == NavigationItem.fridge,
                                      // iconPath: AppVectors.fridgeIcon,
                                      iconPath: AppVectors.fridgeFilledIcon,
                                      width: 24,
                                      color:
                                          state == NavigationItem.fridge
                                              ? selectedMainColor
                                              : inactiveColor,

                                      onTap:
                                          () => context.read<NavigationCubit>().setPage(
                                            NavigationItem.fridge,
                                          ),
                                    ),

                                    // Recipes Nav Bar Item
                                    NavBarItem(
                                      label: 'Recipes',

                                      isSelected: state == NavigationItem.recipes,
                                      // iconPath: AppIcons.cooking,
                                      iconPath: AppIcons.cookingFilled,
                                      // iconPath: AppIcons.chef,
                                      // iconPath: AppIcons.chefFilled,
                                      width: 24,
                                      color:
                                          state == NavigationItem.recipes
                                              ? selectedMainColor
                                              : inactiveColor,
                                      onTap:
                                          () => context.read<NavigationCubit>().setPage(
                                            NavigationItem.recipes,
                                          ),
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
                                          state == NavigationItem.settings
                                              ? selectedMainColor
                                              : inactiveColor,
                                      onTap:
                                          () => context.read<NavigationCubit>().setPage(
                                            NavigationItem.settings,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.read<NavigationCubit>().setPage(
                        _showAdd ? NavigationItem.addProduct : NavigationItem.search,
                      );
                    },
                    onHorizontalDragEnd: (details) {
                      final velocity = details.primaryVelocity ?? 0;

                      if (velocity.abs() > 120) {
                        setState(() {
                          _showAdd = !_showAdd;
                        });

                        context.read<NavigationCubit>().setPage(
                          _showAdd ? NavigationItem.addProduct : NavigationItem.search,
                        );
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color:
                            isFloatButtonSelected
                                ? selectedBackgroundColor
                                : Colors.white.withValues(alpha: 0.88),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 18,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedSlide(
                              offset: _showAdd ? Offset.zero : Offset(-1.2, 0),
                              duration: Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,

                              child: AnimatedOpacity(
                                opacity: _showAdd ? 1 : 0,
                                duration: Duration(milliseconds: 180),
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: isFloatButtonSelected ? selectedMainColor : inactiveColor,
                                ),
                              ),
                            ),

                            AnimatedSlide(
                              offset: _showAdd ? Offset(1.2, 0) : Offset.zero,
                              duration: Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,

                              child: AnimatedOpacity(
                                opacity: _showAdd ? 0 : 1,
                                duration: Duration(milliseconds: 180),
                                child: Transform.rotate(
                                  angle: -math.pi / 18,
                                  child: Image.asset(
                                    AppIcons.searchFilled,
                                    width: 26,
                                    color:
                                        isFloatButtonSelected ? selectedMainColor : inactiveColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 60,
                  //   height: 57,
                  //   child: GestureDetector(
                  //     onTap:
                  //         () => context.read<NavigationCubit>().setPage(NavigationItem.addProduct),
                  //     behavior: HitTestBehavior.opaque,
                  //     child: AnimatedContainer(
                  //       duration: const Duration(milliseconds: 220),
                  //       curve: Curves.easeOutCubic,
                  //       width: 58,
                  //       height: 58,
                  //       decoration: BoxDecoration(
                  //         color:
                  //             state == NavigationItem.addProduct
                  //                 ? selectedBackgroundColor
                  //                 : Colors.white.withValues(alpha: 0.88),
                  //         shape: BoxShape.circle,
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.black.withValues(alpha: 0.08),
                  //             blurRadius: 18,
                  //             offset: const Offset(0, 6),
                  //           ),
                  //         ],
                  //       ),
                  //       child: Icon(
                  //         Icons.add,
                  //         size: 30,
                  //         color:
                  //             state == NavigationItem.addProduct
                  //                 ? selectedMainColor
                  //                 : inactiveColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
