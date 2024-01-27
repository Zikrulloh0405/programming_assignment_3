import 'dart:io';
import 'package:programming_assignment_3/pages/home_page.dart';
import 'package:programming_assignment_3/pages/user/menu_page.dart';
import 'package:programming_assignment_3/pages/user/resevation_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class UserHomePage extends AppMenu {
  @override
  Future<void> build() async {
    print('User Home Page');
    print('1. Reservation');
    print('2. Menu');
    print('3. Return');
    print('0. Exit');

    String? userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        Navigator.push(UserReservationPage());
        break;
      case '2':
        Navigator.push(UserMenuPage());
        break;
      case '3':
        Navigator.pushReplacement(HomePage());
        break;
      case '0':
        exit(0);
      default:
    }
  }
}
