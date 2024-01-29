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


  static Future push(AppMenu AppMenu) async {
    _list.add(AppMenu);
    await _runAppMenu();
  }



  static Future<void> pushReplacement(AppMenu AppMenu) async {
    _list.removeLast();
    _list.add(AppMenu);
    await _runAppMenu();
  }


  static Future<String?> pop({String? message}) async  {
    _list.removeLast();
    await _runAppMenu();
    return message;
  }

}