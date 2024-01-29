import 'dart:io';
import 'package:programming_assignment_3/pages/home_page.dart';
import 'package:programming_assignment_3/pages/user/menu_page.dart';
import 'package:programming_assignment_3/pages/user/resevation_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';
import 'package:programming_assignment_3/services/options.dart';

class UserHomePage extends AppMenu {
  @override
  Future<void> build() async {
    print('User Home Page');
    print('1. Reservation');
    print('2. Menu');
    print('3. Return');
    print('0. Exit');

    int choice = getUserInput(4);

    switch (choice) {
      case 1:
        Navigator.push(UserReservationPage());
        break;
      case 2:
        Navigator.push(UserMenuPage());
        break;
      case 3:
        Navigator.pushReplacement(HomePage());
        break;
      case 0:
        exit(0);
    }
  }
}
