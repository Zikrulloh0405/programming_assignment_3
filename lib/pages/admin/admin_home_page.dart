import 'dart:io';

import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/pages/admin/add_new_product.dart';
import 'package:programming_assignment_3/pages/admin/detail_product_page.dart';
import 'package:programming_assignment_3/pages/admin/menu_page.dart';
import 'package:programming_assignment_3/pages/admin/reservation_page.dart';
import 'package:programming_assignment_3/pages/home_page.dart';
import 'package:programming_assignment_3/pages/user/menu_page.dart';
import 'package:programming_assignment_3/pages/user/resevation_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class AdminHomePage extends AppMenu {
  @override
  Future<void> build() async {
    print('Admin Home Page');

    print("1. Reservation\n2. Menu\n3. Return\n0. Exit");
    String? userInput = stdin.readLineSync();
    switch (userInput) {
      case '1':
        Navigator.push(AdminReservationPage());
        break;
      case '2':
        Navigator.push(AdminMenuPage());
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
