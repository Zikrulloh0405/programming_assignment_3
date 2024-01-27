import 'dart:io';

import 'package:chalkdart/chalk.dart';
import 'package:programming_assignment_3/pages/admin/admin_home_page.dart';
import 'package:programming_assignment_3/pages/user/user_home_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class HomePage extends AppMenu {
  static const String id = "/home_page";

  @override
  Future<void> build() async {
    print(chalk.bgWhite.black('1. Admin \n2. User  \n0. Exit  '));

    String? menuSelection = stdin.readLineSync();
    switch (menuSelection) {
      case '1':
        print(chalk.bgBlackBright('Admin'));
        Navigator.push(AdminHomePage());
        break;
      case '2':
        print(chalk.bgBlackBright('User'));
        Navigator.push(UserHomePage());
        break;
      case '0':
        exit(0);
      default:
    }
  }
}