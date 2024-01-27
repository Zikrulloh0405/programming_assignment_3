//! create product draft _ 1
/*
// import 'dart:io';

// import '../../models/product_model.dart';
// import '../../models/reservation_model.dart';
// import '../../services/app_menu.dart';
// import '../../services/get_menu.dart';
// import '../../services/get_reservation.dart';
// import '../../services/navigator_service.dart';
// import 'user_home_page.dart';

// class CreateReservation extends AppMenu {
//   @override
//   Future<void> build() async {
//     print('Create Reservation: ');

//     stdout.write("Enter Name: ");
//     String name = stdin.readLineSync() ?? '';

//     stdout.write("Enter Phone Number: ");
//     String phoneNumber = stdin.readLineSync() ?? '';

//     stdout.write("Enter Date: ");
//     String date = stdin.readLineSync() ?? '';

//     stdout.write("Enter Time: ");
//     String time = stdin.readLineSync() ?? '';

//     stdout.write("Enter Number of Guests: ");
//     int numberOfGuests = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

//     // Define tables with seats and categories
//     List<Map<String, dynamic>> tables = [
//       {"seats": 2, "category": "min_1"},
//       {"seats": 2, "category": "min_2"},
//       {"seats": 2, "category": "min_3"},
//       {"seats": 4, "category": "mid_1"},
//       {"seats": 4, "category": "mid_2"},
//       {"seats": 4, "category": "mid_3"},
//       {"seats": 6, "category": "max_1"},
//       {"seats": 6, "category": "max_2"},
//       {"seats": 6, "category": "max_3"},
//     ];

//     print("List of available tables: ");

//     for (var i = 0; i < tables.length; i++) {
//       var table = tables[i];
//       var category = table['category'];
//       print(
//           "${i + 1}. Table №  $category. Table with number of seats ${table['seats']}");
//     }

//     stdout.write("Choose a table by entering its number: ");
//     int tableChoice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

//     if (tableChoice >= 1 && tableChoice <= tables.length) {
//       var selectedTable = tables[tableChoice - 1];
//       var category = selectedTable['category'];

//       var table = "Table № : $category";

//       List<ChoosenProduct> choosenProducts = [];

//       print(
//           'Choose products by number (enter 0 to finish selecting products):');

//       while (true) {
//         printMenuList();

//         stdout.write("Enter the number of the product (0 to finish): ");
//         int selectedProductIndex =
//             int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

//         if (selectedProductIndex == 0) {
//           break;
//         }

//         if (selectedProductIndex >= 1 &&
//             selectedProductIndex <= menuList.length) {
//           Product selectedProduct = menuList[selectedProductIndex - 1];

//           stdout.write("Enter the count of ${selectedProduct.nameOfProduct}: ");
//           int count = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

//           if (count > 0) {
//             choosenProducts
//                 .add(ChoosenProduct(product: selectedProduct, count: count));
//             print('${selectedProduct.nameOfProduct} added to reservation.');
//           } else {
//             print('Invalid count. Product not added to reservation.');
//           }
//         } else {
//           print('Invalid product number.');
//         }
//       }

//       double totalPrice = calculateTotalPrice(choosenProducts);

//       Reservation reservation = Reservation(
//         name: name,
//         phoneNumber: phoneNumber,
//         date: date,
//         time: time,
//         choosenProducts: choosenProducts,
//         numberOfGuests: numberOfGuests,
//         table: table,
//         totalPrice: totalPrice,
//       );

//       reservationList.add(reservation);

//       print('Reservation created successfully.');
//       Navigator.push(UserHomePage());
//     } else {
//       print('Invalid table number.');
//     }
//   }

//   void printMenuList() {
//     print('Menu List:');
//     for (int i = 0; i < menuList.length; i++) {
//       Product product = menuList[i];
//       print(
//           "${i + 1}. ${product.nameOfProduct.padRight(15)} : \$${product.priceOfProduct.toStringAsFixed(2)}");
//     }
//   }

//   double calculateTotalPrice(List<ChoosenProduct> choosenProducts) {
//     double totalPrice = 0.0;
//     for (ChoosenProduct chosenProduct in choosenProducts) {
//       totalPrice += chosenProduct.product.priceOfProduct * chosenProduct.count;
//     }
//     return totalPrice;
//   }
// }
*/
