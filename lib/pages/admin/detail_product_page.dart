import 'dart:io';

import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/pages/admin/admin_home_page.dart';
import 'package:programming_assignment_3/services/app_menu.dart';
import 'package:programming_assignment_3/services/get_menu.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

class DetailProductPage extends AppMenu {
  final Product selectedProduct;
  int currentProductIndex;
  DetailProductPage(this.selectedProduct, this.currentProductIndex);

  @override
  Future<void> build() async {
    print('Detail of ${selectedProduct.nameOfProduct}');
     viewMenu([selectedProduct]);
    print('1. Update this product      2. Delete Product   3. Return');
    String? userInput = stdin.readLineSync();
    switch (userInput) {
      case '1':
        updateProduct(
          selectedProduct, currentProductIndex - 1
        );
        Navigator.push(AdminHomePage());
        break;
      case '2':
        deleteProduct(currentProductIndex - 1);
        Navigator.push(AdminHomePage());
        break;
      case '3':
        Navigator.pop();
        break;
      case '0':
        exit(0);
      default:
    }
  }
}
