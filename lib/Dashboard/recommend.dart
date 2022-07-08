import 'package:flutter/material.dart';
// import 'package:restaurant_order_app/Components.dart';

import '../Components.dart';
import '../ItemView/main_item_view.dart';

final List<Map<String, String>> afternoonJsonString = [
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
  {"period": "2", "id": "24", "food": "Semo", "price": "300"}
];
final List<Map<String, String>> morningJsonString = [
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

class Recommend extends StatefulWidget {
  const Recommend({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RecommendView();
  }
}

class _RecommendView extends State<Recommend> {
  PageController pageController = PageController(viewportFraction: 0.8);
  TimeOfDay now = TimeOfDay.now();

  var _currPgValue = 0.0;
  final double _scalefactor = 0.8;
  final double _height = 200;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPgValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> JsonString =
        (now.hour < 12) ? morningJsonString : afternoonJsonString;
    // if(){};

    return SizedBox(
      height: 250,
      child: PageView.builder(
        pageSnapping: true,
        controller: pageController,
        itemCount: JsonString.length,
        onPageChanged: (page) {
          setState(() {
            // print(page);
            _currPgValue = page.toDouble();
          });
        },
        itemBuilder: (context, position) {
          String? period = JsonString[position]['period'];
          String? id = JsonString[position]['id'];
          String? food = JsonString[position]['food'];
          String? price = JsonString[position]['price'];

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
              child: _PageContent(position, period!, id!, food!, price!));
        },
      ),
    );
  }

  Widget _PageContent(
      int index, String period, String id, String food, String price) {
    Widget recommendView = Container();
    // TimeOfDay now = TimeOfDay.now();
    Matrix4 matrix = Matrix4.identity();

    if (index == _currPgValue.floor()) {
      var currscale = 1 - (_currPgValue - index) * (1 - _scalefactor);
      var currTrans = _height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPgValue.floor() + 1) {
      var currscale =
          _scalefactor + (_currPgValue - index + 1) * (1 - _scalefactor);
      var currTrans = _height * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    recommendView = Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Colors.cyanAccent : Colors.blueGrey,
                image: DecorationImage(
                  image: AssetImage("assets/images/food/$id.jpeg"),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                height: 80,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: food,
                      color: Colors.orangeAccent,
                    ),
                    SmallText(
                      text: "₦ $price",
                      color: Colors.black54,
                    )
                  ],
                )),
          )
        ],
      ),
    );

    return recommendView;
  }
}
