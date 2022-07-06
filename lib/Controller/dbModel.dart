// class Orderfields {

// }







// final String tableOrder = 'order';

// class OrderFields {
//   static final List<String> values = [
//     id,
//     index,
//     foodname,
//     foodprice,
//     qty,
//     total,
//   ];

//   static final String id = "id";
//   static final String index = "index";
//   static final String foodname = "foodname";
//   static final String foodprice = "foodprice";
//   static final String qty = "qty";
//   static final String total = "total";
// }

// class Order {
//   final int? id;
//   final int index;
//   final String foodname;
//   final String foodprice;
//   final int qty;
//   final int total;

//   const Order({
//     this.id,
//     required this.index,
//     required this.foodname,
//     required this.foodprice,
//     required this.qty,
//     required this.total,
//   });

//   Order copy({
//     int? id,
//     int? index,
//     String? foodname,
//     String? foodprice,
//     int? qty,
//     int? total,
//   }) =>
//       Order(
//         id: id ?? this.id,
//         index: index ?? this.index,
//         foodname: foodname ?? this.foodname,
//         foodprice: foodprice ?? this.foodprice,
//         qty: qty ?? this.qty,
//         total: total ?? this.qty,
//       );

//   static Order fromJson(Map<String, Object?> json) => Order(
//       id: json[OrderFields.id] as int?,
//       index: json[OrderFields.index] as int,
//       foodname: json[OrderFields.foodname] as String,
//       foodprice: json[OrderFields.foodprice] as String,
//       qty: json[OrderFields.qty] as int,
//       total: json[OrderFields.total] as int);

//   Map<String, Object?> toJson() => {
//         OrderFields.id: id,
//         OrderFields.index: index,
//         OrderFields.foodname: foodname,
//         OrderFields.foodprice: foodprice,
//         OrderFields.qty: qty,
//         OrderFields.total: total
//       };
// }
























// // class Order {
// //   final int? index;
// //   final int? id;
// //   final String? foodname;
// //   final String? foodprice;
// //   final int? qty;
// //   final int? total;

// //   Order(
// //       {this.index,
// //       this.id,
// //       this.foodname,
// //       this.foodprice,
// //       this.qty,
// //       this.total});

// //   factory Order.fromMap(Map<String, dynamic> json) => Order(
// //       index: json['index'],
// //       id: json['id'],
// //       foodname: json['foodname'],
// //       foodprice: json['foodname'],
// //       qty: json['qty'],
// //       total: json['total']);

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'index': index,
// //       'id': id,
// //       'foodname': foodname,
// //       'foodprice': foodprice,
// //       'qty': qty,
// //       'total': total,
// //     };
// //   }
// // }
