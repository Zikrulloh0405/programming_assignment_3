import 'dart:convert';

import 'package:programming_assignment_3/models/product_model.dart';

ReservationModel reservationModelFromJson(String str) => ReservationModel.fromJson(json.decode(str));

String reservationModelToJson(ReservationModel data) => json.encode(data.toJson());

class ReservationModel {
    List<Reservation> reservation;

    ReservationModel({
        required this.reservation,
    });

    factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
        reservation: List<Reservation>.from(json["reservation"].map((x) => Reservation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "reservation": List<dynamic>.from(reservation.map((x) => x.toJson())),
    };
}

class Reservation {
    String name;
    String phoneNumber;
    String date;
    String time;
    List<ChoosenProduct> choosenProducts;
    int numberOfGuests;
    String table;
    double totalPrice;

    Reservation({
        required this.name,
        required this.phoneNumber,
        required this.date,
        required this.time,
        required this.choosenProducts,
        required this.numberOfGuests,
        required this.table,
        required this.totalPrice,
    });

    factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        date: json["date"],
        time: json["time"],
        choosenProducts: List<ChoosenProduct>.from(json["choosenProducts"].map((x) => ChoosenProduct.fromJson(x))),
        numberOfGuests: json["numberOfGuests"],
        table: json["table"],
        totalPrice: json["totalPrice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "date": date,
        "time": time,
        "choosenProducts": List<dynamic>.from(choosenProducts.map((x) => x.toJson())),
        "numberOfGuests": numberOfGuests,
        "table": table,
        "totalPrice": totalPrice,
    };
}

class ChoosenProduct {
    Product product;
    int count;

    ChoosenProduct({
        required this.product,
        required this.count,
    });

    factory ChoosenProduct.fromJson(Map<String, dynamic> json) => ChoosenProduct(
        product: Product.fromJson(json["product"]),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "count": count,
    };
}


