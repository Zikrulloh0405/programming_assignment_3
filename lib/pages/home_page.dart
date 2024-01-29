import 'dart:io';

import 'package:chalkdart/chalk.dart';

import '../services/app_menu.dart';
import '../services/navigator_service.dart';
import '../services/options.dart';
import 'admin/admin_home_page.dart';
import 'user/user_home_page.dart';

class HomePage extends AppMenu {
  static const String id = "/home_page";

  @override
  Future<void> build() async {
    print(chalk.bgWhite.black('1. Admin \n2. User  \n0. Exit  '));

    int choice = getUserInput(3); 

    switch (choice) {
      case 1:
        print(chalk.bgBlackBright('Admin'));
        Navigator.push(AdminHomePage());
        break;
      case 2:
        print(chalk.bgBlackBright('User'));
        Navigator.push(UserHomePage());
        break;
      case 0:
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
