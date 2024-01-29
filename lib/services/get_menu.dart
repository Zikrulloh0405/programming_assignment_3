import 'dart:io';

import 'package:programming_assignment_3/models/product_model.dart';
import 'package:programming_assignment_3/pages/admin/admin_home_page.dart';
import 'package:programming_assignment_3/pages/admin/menu_page.dart';
import 'package:programming_assignment_3/services/navigator_service.dart';

List<Product> menuList = [
  Product(
    categoryOfProduct: 'Meal',
    nameOfProduct: 'Osh',
    priceOfProduct: 5,
    receptOfProduct: ['Sabzi, Piyoz'],
    descriptionOfProduct: 'Mazzali',
  ),
];

void viewMenu(List<Product> listOfMenu) {
  if (listOfMenu.isEmpty) {
    print('There is no items');
  } else {
    listOfMenu.forEach((product) {
      print("Category: ${product.categoryOfProduct}");
      print("Name: ${product.nameOfProduct}");
      print("Price: \$${product.priceOfProduct}");
      print("Recept: ${product.receptOfProduct}");
      print("Description: ${product.descriptionOfProduct}");
      print("-----------------------------");
    });
  }
}

void addMenu(List<Product> product) {
  String validateAndFormatString(String input) {
    String formattedInput = '';
    while (formattedInput.isEmpty) {
      input = input.trim();

      if (input.length < 3) {
        print('Invalid input. The input must have at least 3 letters.');
        print('Please enter a valid input:');
        input = stdin.readLineSync()!;
        continue;
      }

      List<String> words = input.split(' ');
      for (int i = 0; i < words.length; i++) {
        String word = words[i];
        if (word.length >= 1) {
          words[i] = word[0].toUpperCase() + word.substring(1).toLowerCase();
        }
      }

      formattedInput = words.join(' ');

      if (formattedInput.isEmpty) {
        print('Invalid input. Please enter a valid input:');
        input = stdin.readLineSync()!;
      }
    }
    return formattedInput;
  }

  double validatePrice() {
    double price = 0;
    while (price <= 0.5) {
      stdout.write("Enter Price (greater than 0.5): ");
      price = double.tryParse(stdin.readLineSync()!) ?? 0;
      if (price <= 0.5) {
        print('Invalid input. Price must be greater than 0.5.');
      }
    }
    return price;
  }

  stdout.write("Enter Category: ");
  var category = validateAndFormatString(stdin.readLineSync()!);

  stdout.write("Enter Name: ");
  var name = validateAndFormatString(stdin.readLineSync()!);

  var price = validatePrice();

  List<String> receptList = [];
  while (receptList.isEmpty) {
    stdout.write("Enter Recept (comma-separated): ");
    var recept = stdin.readLineSync()!;
    receptList = recept
        .split(',')
        .map((e) {
          return validateAndFormatString(e);
        })
        .where((e) => e.isNotEmpty)
        .toList();

    if (receptList.isEmpty) {
      print(
          'Invalid input. At least one valid word is required in the recept.');
    }
  }

  stdout.write("Enter Description: ");
  var description = validateAndFormatString(stdin.readLineSync()!);

  var newProduct = Product(
    categoryOfProduct: category,
    nameOfProduct: name,
    priceOfProduct: price,
    receptOfProduct: receptList,
    descriptionOfProduct: description,
  );

  product.add(newProduct);
  print('Added Successfully');
  Navigator.push(AdminHomePage());
}

void updateProduct(Product product, int index) {
  print("Current details: New Details :");
  print("Category: ${product.categoryOfProduct}");
  print("Name: ${product.nameOfProduct}");
  print("Price: ${product.priceOfProduct}");
  print("Recept: ${product.receptOfProduct}");
  print("Description: ${product.descriptionOfProduct}");

  stdout.write("Enter new Category (or press Enter to keep current): ");
  var newCategory = stdin.readLineSync()!;
  stdout.write("Enter new Name (or press Enter to keep current): ");
  var newName = stdin.readLineSync()!;
  stdout.write("Enter new Price (or press Enter to keep current): ");
  double newPrice = stdin.readLineSync()!.isEmpty
      ? product.priceOfProduct
      : double.parse(stdin.readLineSync()!);
  stdout.write(
      "Enter new Recept (comma-separated, or press Enter to keep current): ");
  var newRecept = stdin.readLineSync()!.isEmpty
      ? product.receptOfProduct
      : stdin.readLineSync()!.split(',').map((e) => e.trim()).toList();
  stdout.write("Enter new Description (or press Enter to keep current): ");
  var newDescription = stdin.readLineSync()!;

  var updatedProduct = Product(
    categoryOfProduct:
        newCategory.isNotEmpty ? newCategory : product.categoryOfProduct,
    nameOfProduct: newName.isNotEmpty ? newName : product.nameOfProduct,
    priceOfProduct: newPrice,
    receptOfProduct: newRecept.isNotEmpty ? newRecept : product.receptOfProduct,
    descriptionOfProduct: newDescription.isNotEmpty
        ? newDescription
        : product.descriptionOfProduct,
  );

  menuList[index] = updatedProduct;

  print("Product updated successfully.");
  Navigator.push(AdminMenuPage());
}

void deleteProduct(int currentProductIndex) {
  if (menuList.length <= 1) {
    print(
        'You cannot delete this item from Menu, because, menu shouldt be empty');
    Navigator.pushReplacement(AdminHomePage());
  } else {
    menuList.removeAt(currentProductIndex);
    print("Product deleted successfully.");
    Navigator.push(AdminMenuPage());
  }
}
