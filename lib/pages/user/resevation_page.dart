import 'dart:io';
import 'package:programming_assignment_3/models/reservation_model.dart';
import 'package:programming_assignment_3/pages/user/create_reservation.dart';
import 'package:programming_assignment_3/pages/user/detail_reser_page.dart';
import 'package:programming_assignment_3/pages/user/user_home_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_reservation.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';
import 'package:programming_assignment_3/services/options.dart';

class UserReservationPage extends AppMenu {
  @override
  Future<void> build() async {
    print('Reservation Page');

    printEachResetvation(reservationList);
    print('1. Create Reservation ');
    print('2. Return');
    print('0. Exit');

    int userChoice = getUserInput(2);
    switch (userChoice) {
      case 1:
        Navigator.push(CreateReservation());
        break;
      case 2:
        Navigator.pop();
        break;
      case 0:
        exit(0);
      default:
    }
  }

  Future<void> printEachResetvation(List<Reservation> listOfResevations) async {
    if (listOfResevations.isNotEmpty) {
      for (var i = 0; i < listOfResevations.length; i++) {
        var item = listOfResevations[i];
        print("${i + 1}. ${item.name} \$${item.totalPrice}");
      }

      print("Input the number of reservation to view it details ... ");
      print("01. Create New Reservation\n02.Return \n0. Exit");
      String userInput = stdin.readLineSync() ?? '0';
      int selectedIndex = int.tryParse(userInput) ?? 0;
      switch (userInput) {
        case '01':
          Navigator.pushReplacement(CreateReservation());
          break;
        case '02':
          Navigator.pushReplacement(UserHomePage());
          break;
        case '0':
          exit(0);
        default:
          if (selectedIndex > 0 && selectedIndex <= listOfResevations.length) {
            Reservation reservation = listOfResevations[selectedIndex - 1];
            await Navigator.push(
                DetailReservationPage(reservation, selectedIndex));
          } else {
            print('Invalid syntaxis');
          }
      }
    } else if (listOfResevations.isEmpty) {
      print('There is no any reservation ... ');
      print("1. Create New Reservation\n2. Return\n0. Exit");
      int userChoice = getUserInput(3);
      switch (userChoice) {
        case 1:
          Navigator.push(CreateReservation());
          break;
        case 2:
          Navigator.pop();
          break;
        case 0:
          exit(0);
      }
    }
  }
}
