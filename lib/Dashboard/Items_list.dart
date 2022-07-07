import 'package:flutter/material.dart';
// import 'package:restaurant_order_app/ItemView/main_item_view.dart';

import '../Components.dart';
import '../ItemView/main_item_view.dart';

final List<Map<String, String>> JsonString = [
  {"period": "2", "id": "1", "food": "White Rice & stew", "price": "800"},
  {"period": "2", "id": "2", "food": "White Rice & sauce", "price": "800"},
  {"period": "2", "id": "3", "food": "Jellof Rice", "price": "500"},
  {"period": "2", "id": "4", "food": "Fried Rice", "price": "800"},
  {"period": "2", "id": "5", "food": "Ofada Rice & Stew", "price": "500"},
  {"period": "2", "id": "6", "food": "Egwusi Soup", "price": "800"},
  {"period": "2", "id": "7", "food": "Ogbono Soup", "price": "800"},
  {"period": "2", "id": "9", "food": "Banga Soup", "price": "800"},
  {"period": "2", "id": "10", "food": "Vegetable Soup", "price": "1000"},
  {"period": "2", "id": "11", "food": "Afang Soup", "price": "1000"},
  {"period": "2", "id": "12", "food": "Nsala Soup", "price": "800"},
  {"period": "2", "id": "13", "food": "Cat Fish", "price": "1000"},
  {"period": "2", "id": "14", "food": "Fish", "price": "500"},
  {"period": "2", "id": "15", "food": "Beef", "price": "300"},
  {"period": "2", "id": "16", "food": "Chicken", "price": "1500"},
  {"period": "2", "id": "17", "food": "Goat Meat", "price": "1500"},
  {"period": "2", "id": "18", "food": "Roasted Chicken", "price": "1500"},
  {"period": "2", "id": "19", "food": "Plantain", "price": "100"},
  {"period": "2", "id": "20", "food": "Egg", "price": "200"},
  {"period": "2", "id": "21", "food": "Pomo", "price": "200"},
  {"period": "2", "id": "22", "food": "Eba", "price": "300"},
  {"period": "2", "id": "23", "food": "Fufu", "price": "300"},
  {"period": "2", "id": "24", "food": "Semo", "price": "300"},
  {"period": "1", "id": "25", "food": "Tea & Bread", "price": "800"},
  {"period": "1", "id": "26", "food": "Coffee & Bread", "price": "800"},
  {"period": "1", "id": "27", "food": "Bread & Butter", "price": "800"},
  {"period": "1", "id": "28", "food": "Coffee & Omelette", "price": "1000"},
  {"period": "1", "id": "29", "food": "Tea & Omelette", "price": "1000"},
  {"period": "1", "id": "30", "food": "Tea & Pancakes", "price": "800"},
  {"period": "1", "id": "31", "food": "Coffee & Pancakes", "price": "800"},
  {"period": "1", "id": "32", "food": "Beans Balls & Pap", "price": "500"},
  {"period": "1", "id": "33", "food": "Beans & Custard", "price": "800"},
  {"period": "1", "id": "34", "food": "Bread & Omelette", "price": "800"}
];

class MyListItems extends StatefulWidget {
  double? index;

  MyListItems({Key? key, this.index}) : super(key: key);

  @override
  State<MyListItems> createState() => MyListItemsState();
}

class MyListItemsState extends State<MyListItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.black,
        endIndent: 10,
        indent: 10,
      ),
      itemCount: JsonString.length,
      itemBuilder: (context, index) {
        final id = JsonString[index]['id'];
        final food = JsonString[index]['food'];
        final price = JsonString[index]['price'];

        return GestureDetector(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => ItemView(
                          id: id,
                          food: food,
                          price: price,
                        ))))
          },
          // child: Container(
          //   child: Text("${id} " + "  ${food} " + "${price}"),
          // ),
          child: Container(
              width: 220,
              height: 120,
              margin: const EdgeInsets.only(left: 20, bottom: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food/$id.jpeg"))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: food.toString(),
                          size: 16,
                        ),
                        SmallText(
                          text: "₦ $price",
                          color: Colors.orangeAccent,
                        )
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
