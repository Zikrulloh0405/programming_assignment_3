import 'dart:io';
import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class UserMenuPage extends AppMenu {
  @override
  Future<void> build() async {
    print('Menu Page');
    print('Menu List:');

    for (int i = 0; i < menuList.length; i++) {
      Product product = menuList[i];
      print("${i + 1}. ${product.nameOfProduct} : \$${product.priceOfProduct}");
    }

    print('0. Return');
    print('Enter the number of the product to view details:');

    String? userInput = stdin.readLineSync();
    int selectedIndex = int.tryParse(userInput ?? '0') ?? 0;

    if (selectedIndex >= 1 && selectedIndex <= menuList.length) {
      Product selectedProduct = menuList[selectedIndex - 1];
      viewMenu([selectedProduct]);
    } else if (selectedIndex == 0) {
      Navigator.pop();
    } else {
      print('Invalid selection. Please choose a valid product number.');
    }
  }
}
