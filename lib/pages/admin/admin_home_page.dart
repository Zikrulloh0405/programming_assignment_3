import 'dart:io';

import 'package:programming_assignment_3/pages/admin/menu_page.dart';
import 'package:programming_assignment_3/pages/admin/reservation_page.dart';
import 'package:programming_assignment_3/pages/home_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';
import 'package:programming_assignment_3/services/options.dart';

class AdminHomePage extends AppMenu {
  @override
  Future<void> build() async {
    print('Admin Home Page');

    print("1. Reservation\n2. Menu\n3. Return\n0. Exit");
    int userChoice = getUserInput(4);
    switch (userChoice) {
      case 1:
        Navigator.push(AdminReservationPage());
        break;
      case 2:
        Navigator.push(AdminMenuPage());
        break;
      case 3:
        Navigator.pushReplacement(HomePage());
        break;
      case 0:
        exit(0);
      default:
    }
  }
}
