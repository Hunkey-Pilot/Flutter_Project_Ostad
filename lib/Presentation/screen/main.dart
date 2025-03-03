import 'package:flutter/material.dart';
import 'product.dart';

void main() {
  runApp(const Employee());
}


class Employee extends StatelessWidget {
  const Employee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: ProductPage(),

    );
  }
}
