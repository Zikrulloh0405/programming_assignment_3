import 'dart:io';
import 'package:programming_assignment_3/pages/user/resevation_page.dart';
import 'package:programming_assignment_3/services/options.dart';

import '../../models/product_model.dart';
import '../../models/reservation_model.dart';
import '../../services/app_menu.dart';
import '../../services/get_menu.dart';
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

    print('1. Update this reservation');
    print('2. Delete this reservation');
    print('3. Return');
    print('0. Exit');

    int userChoice = getUserInput(4);

    switch (userChoice) {
      case 1:
        updateReservation(currentIndex - 1);
        break;
      case 2:
        deleteReservation(currentIndex - 1);
        break;
      case 3:
        Navigator.pop();
        break;
      case 0:
        exit(0);
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
  }

  Future<void> updateReservation(int index) async {
    Reservation reservation = reservationList[index];

    stdout.write("Enter new name or press Enter to keep current: ");
    String newName = stdin.readLineSync() ?? '';
    if (newName.isNotEmpty) reservation.name = newName;

    stdout.write("Enter new phone number or press Enter to keep current: ");
    String newPhoneNumber = stdin.readLineSync() ?? '';
    if (newPhoneNumber.isNotEmpty) reservation.phoneNumber = newPhoneNumber;

    stdout
        .write("Enter new date (yyyy-MM-dd) or press Enter to keep current: ");
    String newDate = stdin.readLineSync() ?? '';
    if (newDate.isNotEmpty) reservation.date = newDate;

    stdout.write("Enter new time (HH:mm) or press Enter to keep current: ");
    String newTime = stdin.readLineSync() ?? '';
    if (newTime.isNotEmpty) reservation.time = newTime;

    stdout.write("Enter new number of guests or press Enter to keep current: ");
    String newGuests = stdin.readLineSync() ?? '';
    if (newGuests.isNotEmpty) reservation.numberOfGuests = int.parse(newGuests);

    stdout.write("Enter new table number or press Enter to keep current: ");
    String newTable = stdin.readLineSync() ?? '';
    if (newTable.isNotEmpty) reservation.table = newTable;

    print("Do you want to keep the current chosen products and counts?");
    for (int i = 0; i < reservation.choosenProducts.length; i++) {
      ChoosenProduct chosenProduct = reservation.choosenProducts[i];
      Product product = chosenProduct.product;

      stdout.write(
          '${i + 1}. ${product.nameOfProduct} (Count: ${chosenProduct.count}) - Enter new count or press Enter to keep current: ');
      String newCountInput = stdin.readLineSync() ?? '';
      if (newCountInput.isNotEmpty) {
        int newCount = int.tryParse(newCountInput) ?? chosenProduct.count;
        reservation.choosenProducts[i] =
            ChoosenProduct(product: product, count: newCount);
      }
    }

    print("Select new products (enter product number, 0 to end):");
    while (true) {
      for (int i = 0; i < menuList.length; i++) {
        print("${i + 1}. ${menuList[i].nameOfProduct}");
      }
      int productChoice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
      if (productChoice == 0) break;
      if (productChoice > 0 && productChoice <= menuList.length) {
        Product chosenProduct = menuList[productChoice - 1];
        stdout.write("Enter quantity for ${chosenProduct.nameOfProduct}: ");
        int quantity = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        if (quantity > 0) {
          reservation.choosenProducts
              .add(ChoosenProduct(product: chosenProduct, count: quantity));
        }
      }
    }

    reservation.totalPrice = reservation.choosenProducts
        .fold(0, (total, cp) => total + (cp.product.priceOfProduct * cp.count));

    reservationList[index] = reservation;
    print("Reservation updated successfully.");
    Navigator.pushReplacement(UserReservationPage());
  }

  Future<void> deleteReservation(int index) async {
    reservationList.removeAt(index);
    print('Reservation deleted successfully.');
    await Navigator.pushReplacement(UserReservationPage());
  }
}
