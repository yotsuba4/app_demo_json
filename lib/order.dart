class Order {
  int orderId;
  User user;
  List<Product> products;

  Order({this.orderId, this.user, this.products});

  factory Order.fromJson(map) {
    return Order(
      orderId: map['orderId'],
      user: User.fromJson(map['user']),
      products: Product.parseData(map),
    );
  }
  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'user': user,
        'products': products,
      };
}

class Product {
  int productId;
  String productName;
  int quantity;
  double price;

  Product({this.productId, this.productName, this.quantity, this.price});
  factory Product.fromJson(map) {
    return Product(
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }

  static List<Product> parseData(map) {
    var list = map['products'] as List;
    return list.map((e) => Product.fromJson(e)).toList();
  }
}

class User {
  String fullName;
  String email;
  User({this.fullName, this.email});
  factory User.fromJson(map) {
    return User(
      fullName: map['fullName'],
      email: map['email'],
    );
  }
}
