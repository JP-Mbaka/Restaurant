class Order {
  final int? index;
  final int? id;
  final String? foodname;
  final String? foodprice;
  final int? qty;
  final int? total;

  Order(
      {this.index,
      this.id,
      this.foodname,
      this.foodprice,
      this.qty,
      this.total});

  factory Order.fromMap(Map<String, dynamic> json) => Order(
      index: json['index'],
      id: json['id'],
      foodname: json['foodname'],
      foodprice: json['foodname'],
      qty: json['qty'],
      total: json['total']);

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'id': id,
      'foodname': foodname,
      'foodprice': foodprice,
      'qty': qty,
      'total': total,
    };
  }
}
