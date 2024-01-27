import 'dart:io';

import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/models/reservation_model.dart';
import 'package:programming_assignment_3/services/get_menu.dart';

List<Reservation> reservationList = [];

void viewReservation(List<Reservation> listOfResevations) {
  if (listOfResevations.isEmpty) {
    print('There is no reservations');
  } else {
    print('Reservations List ... : ');

    listOfResevations.forEach((element) {
      print(element.name);
      print(element.phoneNumber);
      print(element.table);
      print(element.totalPrice);
      print(element.choosenProducts);
      print(element.choosenProducts);
      print('Thats over');
    });
  }
}

void craeteReservation() {
  stdout.write("Enter Name : ");
  var name = stdin.readLineSync()!;
  stdout.write("Enter Phone Number : ");
  var phoneNumber = stdin.readLineSync()!;
  stdout.write("Enter Date : ");
  var date = stdin.readLineSync()!;
  stdout.write("Enter Time : ");
  var time = stdin.readLineSync()!;
  stdout.write("Enter Table : ");
  var table = stdin.readLineSync()!;
  stdout.write("Enter Number of Guests : ");
  var guests = int.tryParse(stdin.readLineSync()!)!;

  stdout.write("Choose product by number : ");

  print('Menu list');
  menuList.asMap().forEach((index, product) {
    print(
        "${index + 1} ${product.nameOfProduct.padRight(15)} : ${product.priceOfProduct.toString().padLeft(15)} \$");
  });
  var meal = int.tryParse(stdin.readLineSync()!) ?? 0;
  var product = menuList[meal - 1];

  stdout.write("Enter the count of meals : ... ");
  var count = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  List<ChoosenProduct> choosenProducts = [];

  choosenProducts.add(ChoosenProduct(product: product, count: count));

  var price = totalPrice(product, count);

  Reservation reservation = Reservation(
      name: name,
      phoneNumber: phoneNumber,
      date: date,
      time: time,
      choosenProducts: choosenProducts,
      numberOfGuests: guests,
      table: table,
      totalPrice: price);

  reservationList.add(reservation);
  print('Reserved succesfully');
}

double totalPrice(Product product, int count) {
  double sum = 0.0;
  sum = product.priceOfProduct * count;
  return sum;
}
