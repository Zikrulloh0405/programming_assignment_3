import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    List<Product> products;

    ProductModel({
        required this.products,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    String categoryOfProduct;
    String nameOfProduct;
    double priceOfProduct;
    List<String> receptOfProduct;
    String descriptionOfProduct;

    Product({
        required this.categoryOfProduct,
        required this.nameOfProduct,
        required this.priceOfProduct,
        required this.receptOfProduct,
        required this.descriptionOfProduct,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoryOfProduct: json["categoryOfProduct"],
        nameOfProduct: json["nameOfProduct"],
        priceOfProduct: json["priceOfProduct"],
        receptOfProduct: List<String>.from(json["receptOfProduct"].map((x) => x)),
        descriptionOfProduct: json["descriptionOfProduct"],
    );

    Map<String, dynamic> toJson() => {
        "categoryOfProduct": categoryOfProduct,
        "nameOfProduct": nameOfProduct,
        "priceOfProduct": priceOfProduct,
        "receptOfProduct": List<dynamic>.from(receptOfProduct.map((x) => x)),
        "descriptionOfProduct": descriptionOfProduct,
    };
}
