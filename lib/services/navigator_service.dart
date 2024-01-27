import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/my_app.dart';


class Navigator {
  static final List<AppMenu> _list = <AppMenu>[];

  static set initialValue(AppMenu AppMenu) {
    _list.add(AppMenu);
  }

  static Future _runAppMenu() async {
    await _list.last.build();
  }

  static AppMenu? _findAppMenu(String id) {
    return MyApp.routeAppMenu[id];
  }

  static Future push(AppMenu AppMenu) async {
    _list.add(AppMenu);
    await _runAppMenu();
  }

  static Future<void> pushNamed(String id) async{
    AppMenu appMenu = _findAppMenu(id)!;
    await push(appMenu);
  }

  static Future<void> pushReplacement(AppMenu AppMenu) async {
    _list.removeLast();
    _list.add(AppMenu);
    await _runAppMenu();
  }

  static Future<void> pushReplacementNamed(String id) async{
    AppMenu appMenu = _findAppMenu(id)!;
    await pushReplacement(appMenu);
  }

  static Future<String?> pop({String? message}) async  {
    _list.removeLast();
    await _runAppMenu();
    return message;
  }

  static Future<String?> popUntil({String? message}) async {
    _list.removeRange(1, _list.length);
    await _runAppMenu();
    return message;
  }
}