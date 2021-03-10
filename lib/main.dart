import 'dart:convert';

import 'package:app_demo_json/order.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const jsonString = ''' 
{
    "orderId":123456,
    "user":{
        "fullName":"Ryan Nguyen",
        "email":"ryan@gmail.com"
    },
    "products":[
        {
            "productId":123,
            "productName":"Macbook",
            "quantity":10,
            "price":100.5
        },
        {
            "productId":123,
            "productName":"Iphone",
            "quantity":10,
            "price":100.5
        },
         {
            "productId":123,
            "productName":"Ipad",
            "quantity":10,
            "price":100.5
        }
    ]
}
''';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('demo json'),
        ),
        body: JsonInfoWidget(),
      ),
    );
  }
}

class JsonInfoWidget extends StatefulWidget {
  JsonInfoWidget({Key key}) : super(key: key);

  @override
  _JsonInfoWidgetState createState() => _JsonInfoWidgetState();
}

class _JsonInfoWidgetState extends State<JsonInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: ElevatedButton(
              onPressed: () {
                Map<String, dynamic> map = jsonDecode(jsonString);
                var order = Order.fromJson(map);
                print(order.orderId);
                print(order.user.email);
                print(order.user.fullName);
                print('============================');
                order.products.forEach((element) {
                  print(element.productName);
                });
              },
              child: Text('Click'))),
    );
  }
}
