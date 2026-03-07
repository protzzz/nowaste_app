import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { fridge, recipes, notifications, settings }

class NavigationCubit extends Cubit<NavigationItem> {
  NavigationCubit() : super(NavigationItem.fridge);

  void setPage(NavigationItem item) => emit(item);
}
