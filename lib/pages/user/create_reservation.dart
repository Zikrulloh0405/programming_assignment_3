import 'dart:io';
import 'package:intl/intl.dart';
import 'package:programming_assignment_3/pages/user/resevation_page.dart';

import '../../models/product_model.dart';
import '../../models/reservation_model.dart';
import '../../services/app_menu.dart';
import '../../services/get_menu.dart';
import '../../services/get_reservation.dart';
import '../../services/navigator_service.dart';

class CreateReservation extends AppMenu {
  List<Product> menuListCopy = List.from(menuList);

  @override
  Future<void> build() async {
    print('Create Reservation: ');

    String name = '';

    while (name.isEmpty || name.length < 3 || !isNameValid(name)) {
      stdout.write("Enter Name (minimum 3 letters, only letters allowed): ");
      name = stdin.readLineSync() ?? '';

      if (name.isEmpty) {
        print('Name cannot be empty.');
      } else if (name.length < 3) {
        print('Name must have at least 3 letters.');
      } else if (!isNameValid(name)) {
        print('Invalid characters in the name. Only letters are allowed.');
      }
    }

    name = name.substring(0, 1).toUpperCase() + name.substring(1).toLowerCase();

    String phoneNumber = '';

    while (phoneNumber.isEmpty || phoneNumber.length != 9) {
      stdout.write("Enter Phone Number (exactly 9 digits): ");
      phoneNumber = formatPhoneNumber(stdin.readLineSync() ?? '');

      if (phoneNumber.length != 9) {
        print('Invalid phone number. Please enter exactly 9 digits.');
      }
    }

    phoneNumber = '+998' + phoneNumber;


    //! in the following, it checks for valid date time
    DateTime date;
    String formattedDate = '';
    while (formattedDate.isEmpty) {
      stdout.write("Enter Date (yyyy-MM-dd): ");
      String dateInput = stdin.readLineSync() ?? '';
      try {
        date = DateFormat('yyyy-MM-dd').parse(dateInput);
        if (!isDateValid(date)) {
          print(
              'Invalid date. Please enter a date between today and 1 month from today.');
        } else {
          formattedDate = DateFormat('dd-MM-yyyy').format(date);
        }
      } catch (e) {
        print(
            'Invalid date format. Please enter a valid date in yyyy-MM-dd format.');
      }
    }

    if (reservationList.isEmpty) {
    } else {
      for (var i = 0; i < reservationList.length; i++) {
        var chosenItem = reservationList[i];
        var chosenDate = chosenItem.date;
        if (chosenDate == formattedDate) {
          print(
              "${chosenItem.phoneNumber} : ${chosenDate} : ${chosenItem.time} : ${chosenItem.table}");
        }
      }
    }

    DateTime time;
    String formattedTime = '';
    while (formattedTime.isEmpty) {
      stdout.write("Enter Time (HH:mm): ");
      String timeInput = stdin.readLineSync() ?? '';
      try {
        RegExp timeRegExp = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
        if (!timeRegExp.hasMatch(timeInput)) {
          throw FormatException(
              'Invalid time format. Please enter a valid time in HH:mm format.');
        }
        time = DateFormat('HH:mm').parse(timeInput);
        formattedTime = DateFormat('HH-mm').format(time);
      } catch (e) {
        print(e);
      }
    }

    stdout.write("Enter Number of Guests: ");
    int numberOfGuests = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    while (numberOfGuests < 1 || numberOfGuests > 6) {
      print('Invalid number of guests. Please enter a number between 1 and 6.');
      stdout.write("Enter Number of Guests: ");
      numberOfGuests = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    }

    List<Map<String, dynamic>> tables = [
      {"seats": 2, "category": "min_1"},
      {"seats": 2, "category": "min_2"},
      {"seats": 2, "category": "min_3"},
      {"seats": 4, "category": "mid_1"},
      {"seats": 4, "category": "mid_2"},
      {"seats": 4, "category": "mid_3"},
      {"seats": 6, "category": "max_1"},
      {"seats": 6, "category": "max_2"},
      {"seats": 6, "category": "max_3"},
    ];

    List<Map<String, dynamic>> availableTables = [];
    if (numberOfGuests == 2) {
      availableTables = tables.where((table) => table['seats'] == 2).toList();
    } else if (numberOfGuests >= 3 && numberOfGuests <= 4) {
      availableTables = tables.where((table) => table['seats'] == 4).toList();
    } else {
      availableTables = tables.where((table) => table['seats'] == 6).toList();
    }

    List<String> availableTableStrings = [];
    for (var table in availableTables) {
      var category = table['category'];
      var tableString = "Table № : $category";
      var tableIsAvailable = reservationList.every((reservation) =>
          reservation.date != formattedDate ||
          reservation.time != formattedTime ||
          reservation.table != tableString);
      if (tableIsAvailable) {
        availableTableStrings.add(tableString);
      }
    }

    if (availableTableStrings.isEmpty) {
      print(
          'No available tables for this day and time. Please choose another time.');
      return;
    }

    print(
        "Available tables for the selected time, number of guests, and date:");
    for (var i = 0; i < availableTableStrings.length; i++) {
      print("${i + 1}. ${availableTableStrings[i]}");
    }

    stdout.write("Choose a table by entering its number: ");
    int tableChoice = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
    String chosenTable = '';

    if (tableChoice >= 1 && tableChoice <= availableTableStrings.length) {
      chosenTable = availableTableStrings[tableChoice - 1];

      List<ChoosenProduct> choosenProducts = [];

      print(
          'Choose products by number (enter 0 to finish selecting products):');

      while (true) {
        printMenuList(menuListCopy);

        stdout.write("Enter the number of the product (0 to finish): ");
        int selectedProductIndex =
            int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        if (selectedProductIndex == 0) {
          break;
        }

        if (selectedProductIndex >= 1 &&
            selectedProductIndex <= menuListCopy.length) {
          Product selectedProduct = menuListCopy[selectedProductIndex - 1];

          stdout.write("Enter the count of ${selectedProduct.nameOfProduct}: ");
          int count = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

          if (count > 0) {
            choosenProducts
                .add(ChoosenProduct(product: selectedProduct, count: count));
            menuListCopy.remove(
                selectedProduct); // Remove the selected product from the copy
            print('${selectedProduct.nameOfProduct} added to reservation.');
          } else {
            print('Invalid count. Product not added to reservation.');
          }
        } else {
          print('Invalid product number.');
        }
      }

      double totalPrice = calculateTotalPrice(choosenProducts);

      Reservation reservation = Reservation(
        name: name,
        phoneNumber: phoneNumber,
        date: formattedDate,
        time: formattedTime,
        numberOfGuests: numberOfGuests,
        table: chosenTable,
        totalPrice: totalPrice,
        choosenProducts: choosenProducts,
      );

      reservationList.add(reservation);

      print('Reservation created successfully.');
      await Navigator.push(UserReservationPage());
    } else {
      print('Invalid table number.');
    }

    menuListCopy = List.from(menuList);
  }

  String formatPhoneNumber(String input) {
    input = input.replaceAll(RegExp(r'\D'), '');
    if (input.length > 9) {
      input = input.substring(0, 9);
    }
    return input;
  }

  bool isNameValid(String name) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }

  bool isDateValid(DateTime date) {
    DateTime today = DateTime.now();
    DateTime oneMonthFromToday = today.add(Duration(days: 30));
    return date.isAfter(today) && date.isBefore(oneMonthFromToday);
  }

  void printMenuList(List<Product> productList) {
    print('Menu List:');
    for (int i = 0; i < productList.length; i++) {
      Product product = productList[i];
      print(
          "${i + 1}. ${product.nameOfProduct.padRight(15)} : \$${product.priceOfProduct.toStringAsFixed(2)}");
    }
  }

  double calculateTotalPrice(List<ChoosenProduct> choosenProducts) {
    double totalPrice = 0.0;
    for (ChoosenProduct chosenProduct in choosenProducts) {
      totalPrice += chosenProduct.product.priceOfProduct * chosenProduct.count;
    }
    return totalPrice;
  }

}
