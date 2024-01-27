import 'dart:io';
import 'package:programming_assignment_3/pages/admin/admin_home_page.dart';
import 'package:programming_assignment_3/pages/admin/menu_page.dart';
import 'package:programming_assignment_3/pages/user/user_home_page.dart';

import '../../models/product_model.dart';
import '../../models/reservation_model.dart';
import '../../services/app_menu.dart';
import '../../services/get_reservation.dart';
import '../../services/navigator_service.dart';

class DetailReservationPage extends AppMenu {
  final Reservation reservation;
  int currentIndex;
  DetailReservationPage(this.reservation, this.currentIndex);

  @override
  Future<void> build() async {
    print('Detail of Reservation $currentIndex');
    viewReservation(reservation);

    print('1. Delete this reservation');
    print('2. Return');
    print('0. Exit');

    String userInput = stdin.readLineSync() ?? '0';

    switch (userInput) {
      case '1':
        deleteReservation(currentIndex - 1);
        break;
      case '2':
        Navigator.pop();
        break;
      case '0':
        exit(0);
      default:
        print('Invalid choice. Please select a valid option.');
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
  print('Total Price : \$ ${reservation.totalPrice.toStringAsFixed(2)}'.padLeft(20));
  print('');
}


  

  void deleteReservation(int index) async{
    reservationList.removeAt(index);
    print('Reservation deleted successfully.');
    await Navigator.pushReplacement(UserHomePage());
  }
}
