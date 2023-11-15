import 'Customer.dart';

class AddAddonsResponse {
  AddAddonsResponse({
      this.id, 
      this.bookingDate, 
      this.price, 
      this.currencyCode, 
      this.preferredPayment, 
      this.status, 
      this.customer,});

  AddAddonsResponse.fromJson(dynamic json) {
    id = json['id'];
    bookingDate = json['booking_date'];
    price = json['price'];
    currencyCode = json['currency_code'];
    preferredPayment = json['preferred_payment'];
    status = json['status'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  int? id;
  String? bookingDate;
  int? price;
  String? currencyCode;
  String? preferredPayment;
  int? status;
  Customer? customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['booking_date'] = bookingDate;
    map['price'] = price;
    map['currency_code'] = currencyCode;
    map['preferred_payment'] = preferredPayment;
    map['status'] = status;
    final customer = this.customer;
    if (customer != null) {
      map['customer'] = customer.toJson();
    }
    return map;
  }

}