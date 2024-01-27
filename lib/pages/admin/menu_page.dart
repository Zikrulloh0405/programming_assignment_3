import 'dart:io';

import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/pages/admin/add_new_product.dart';
import 'package:programming_assignment_3/pages/admin/detail_product_page.dart';
import 'package:programming_assignment_3/pages/home_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class AdminMenuPage extends AppMenu {
  @override
  Future<void> build() async {
    print('Admin Menu Page');

    await printListOfProducts(menuList);

    String? userInput = stdin.readLineSync();
    switch (userInput) {
      case '1':
        Navigator.push(AddNewProduct());
        break;
      default:
    }
  }
}

Future printListOfProducts(List<Product> listOfMenu) async {
  print('Printing each item');

  if (listOfMenu.isEmpty) {
    print("There is no items");
  } else {
    listOfMenu.asMap().forEach((index, product) {
      print(
          "${index + 1} ${product.nameOfProduct.padRight(15)} : ${product.priceOfProduct.toString().padLeft(15)} \$");
    });

    print("Show detail page of product ... (select product by number)");
    if (menuList.length == 10) {
      print("The list is full. Choose item, to delete it ... :\n02. Return\n0. Exit");
    } else {
      print('01. Add new Product\n02. Return\n0. Exit');
    }
    String? userInput = stdin.readLineSync() ?? '0';
    int selectedIndex = int.tryParse(userInput) ?? 0;

    switch (userInput) {
      case '01':
        if (menuList.length <= 10) {
          Navigator.push(AddNewProduct());
          break;
        }
      case '02':
        Navigator.pushReplacement(HomePage());
        break;
      case '0':
        exit(0);
      default:
        if (selectedIndex > 0 && selectedIndex <= listOfMenu.length) {
          Product selectedProduct = listOfMenu[selectedIndex - 1];
          await Navigator.push(
              DetailProductPage(selectedProduct, selectedIndex));
        } else {
          print('Invalid Input');
        }
    }
  }
}
