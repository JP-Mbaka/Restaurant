// import 'dart:convert';

// // To parse this JSON data, do

// final JsonString = [
//   {"id": 1, "food": "white Rice & stew", "price": 800},
//   {"id": 2, "food": "white Rice & sauce", "price": 800},
//   {"id": 3, "food": "Jellof Rice", "price": 500},
//   {"id": 4, "food": "Fried Rice", "price": 800},
//   {"id": 5, "food": "Ofada Rice & Stew", "price": 500},
//   {"id": 6, "food": "Egwusi Soup", "price": 800},
//   {"id": 7, "food": "Ogbono Soup", "price": 800},
//   {"id": 9, "food": "Banga Soup", "price": 800},
//   {"id": 10, "food": "Vegetable Soup", "price": 1000},
//   {"id": 11, "food": "Afang Soup", "price": 1000},
//   {"id": 12, "food": "Nsala Soup", "price": 800},
//   {"id": 13, "food": "Cat Fish", "price": 1000},
//   {"id": 14, "food": "Fish", "price": 500},
//   {"id": 15, "food": "Beef", "price": 300},
//   {"id": 16, "food": "Chicken", "price": 1500},
//   {"id": 17, "food": "Goat Meat", "price": 1500},
//   {"id": 18, "food": "Roasted Chicken", "price": 1500},
//   {"id": 19, "food": "Plantain", "price": 100},
//   {"id": 20, "food": "Egg", "price": 200},
//   {"id": 21, "food": "Pomo", "price": 200},
//   {"id": 22, "food": "Eba", "price": 300},
//   {"id": 23, "food": "Fufu", "price": 300},
//   {"id": 24, "food": "Semo", "price": 300},
//   {"id": 25, "food": "Tea & Bread", "price": 800},
//   {"id": 26, "food": "Coffee & Bread", "price": 800},
//   {"id": 27, "food": "Bread & Butter", "price": 800},
//   {"id": 28, "food": "Coffee & Omelette", "price": 1000},
//   {"id": 29, "food": "Tea & Omelette", "price": 1000},
//   {"id": 30, "food": "Tea & Pancakes", "price": 800},
//   {"id": 31, "food": "Coffee & Pancakes", "price": 800},
//   {"id": 32, "food": "Beans Balls & Pap", "price": 500},
//   {"id": 33, "food": "Beans & Custard", "price": 800},
//   {"id": 34, "food": "Bread & Omelette", "price": 800}
// ];

// //
// // final  cusines = cusinesFromJson(JsonString);

// List<Cusines> cusinesFromJson(dynamic str) =>
//     List<Cusines>.from(json.decode(str).map((x) => Cusines.fromJson(x)));

// dynamic cusinesToJson(List<Cusines> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Cusines {
//   Cusines({
//     required this.id,
//     required this.food,
//     required this.price,
//   });

//   int id;
//   String food;
//   int price;

//   factory Cusines.fromJson(Map<dynamic, dynamic> json) => Cusines(
//         id: json["id"],
//         food: json["food"],
//         price: json["price"],
//       );

//   Map<dynamic, Object> toJson() => {
//         "id": id,
//         "food": food,
//         "price": price,
//       };
// }
