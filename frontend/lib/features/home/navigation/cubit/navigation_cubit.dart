import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { fridge, recipes, notifications, settings, addProduct, search }

class NavigationCubit extends Cubit<NavigationItem> {
  NavigationCubit() : super(NavigationItem.fridge);

  void setPage(NavigationItem item) => emit(item);
}
