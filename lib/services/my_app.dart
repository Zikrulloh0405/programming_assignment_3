import 'package:programming_assignment_3/services/app_menu.dart';
class MyApp {
  // static Map<String, AppMenu> routeAppMenu = {};

  MyApp({required AppMenu home}) {
    _runApp(home);
  }

  Future<void> _runApp(AppMenu AppMenu) async {
    while (true) {
      await AppMenu.build();
    }
  }
}