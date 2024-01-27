import 'dart:io';
import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/models/reservation_model.dart';
import 'package:programming_assignment_3/pages/admin/admin_home_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_reservation.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class AdminReservationPage extends AppMenu {
  @override
  Future<void> build() async {
    print('Admin Resevation Page');
    print('Reservation List:');

    if (reservationList.isNotEmpty) {
      for (int i = 0; i < reservationList.length; i++) {
        Reservation reservation = reservationList[i];
        print(
            "${i + 1}. ${reservation.phoneNumber} ${reservation.date} ${reservation.totalPrice}");
      }
      print('0. Return');
      print('Enter the number of the reservation to view details:');
      String? userInput = stdin.readLineSync();
      int selectedIndex = int.tryParse(userInput ?? '0') ?? 0;

      if (selectedIndex >= 1 && selectedIndex <= reservationList.length) {
        Reservation selectedReservation = reservationList[selectedIndex - 1];
        viewReservation(selectedReservation);
      } else if (selectedIndex == 0) {
        Navigator.pushReplacement(AdminHomePage());
      } else {
        print('Invalid selection. Please choose a valid reservation number.');
      }
    } else {
      print("There is no any reservation yet ... ");
      print("1. Return\n0. Exit");
      String userInput = stdin.readLineSync() ?? '0';
      switch (userInput) {
        case '1':
          Navigator.pop();
          break;
        case '0':
          exit(0);
        default:
      }
    }
  }

  void viewReservation(Reservation reservation) {
    print('Name : ${reservation.name}'.padLeft(20));
    print('Phone Number : ${reservation.phoneNumber}'.padLeft(20));
    print('Date : ${reservation.date}'.padLeft(20));
    print('Time : ${reservation.time}'.padLeft(20));
    print('Table : ${reservation.table}'.padLeft(20));
    print('Number of guests : ${reservation.numberOfGuests}'.padLeft(20));
    print('');

    for (int i = 0; i < reservation.choosenProducts.length; i++) {
      ChoosenProduct chosenProduct = reservation.choosenProducts[i];
      Product product = chosenProduct.product;
      double subPrice = chosenProduct.count * product.priceOfProduct;

      print(
          '${product.nameOfProduct.padRight(20)} ${chosenProduct.count.toString().padRight(15)} \$ ${product.priceOfProduct.toStringAsFixed(2).padRight(15)} \$ ${subPrice.toStringAsFixed(2)}');
    }

    print('');
    print('Total Price : \$ ${reservation.totalPrice.toStringAsFixed(2)}'
        .padLeft(20));
    print('');

    print("1. Return\n0. Exit");
    String userInput = stdin.readLineSync() ?? '0';
    switch (userInput) {
      case '1':
        Navigator.pop();
        break;
      case '0':
        exit(0);
      default:
    }
  }
}
