import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/features/home/fridge/pages/fridge_page.dart';
import 'package:nowaste_app/features/home/navigation/cubit/navigation_cubit.dart';
import 'package:nowaste_app/features/home/navigation/widget/app_bottom_bar.dart';
import 'package:nowaste_app/features/home/navigation/widget/bottom_nav_bar.dart';
import 'package:nowaste_app/features/home/navigation/widget/center_fab_button.dart';
import 'package:nowaste_app/features/home/recipes/pages/recipes_page.dart';
import 'package:nowaste_app/features/home/settings/pages/settings_page.dart';
import 'package:nowaste_app/features/home/shopping/pages/shopping_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationItem>(
      builder: (context, state) {
        Widget page;

        switch (state) {
          case NavigationItem.fridge:
            page = const FridgePage();
            break;
          case NavigationItem.recipes:
            page = const RecipesPage();
            break;
          case NavigationItem.settings:
            page = const SettingsPage();
            break;
          case NavigationItem.notifications:
            page = const ShoppingPage();
            break;
        }

        return Scaffold(
          extendBody: true,
          body: SafeArea(top: true, bottom: false, child: page),
          bottomNavigationBar: AppBottomBar(),
          // floatingActionButton: ,
          // floatingActionButtonLocation: ,

          // backgroundColor: Colors.grey.shade100,
          // floatingActionButton: Transform.translate(
          //   offset: Offset(0, 12),
          //   child: CenterFabButton(onPressed: () {}),
          // ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
