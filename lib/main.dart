import 'package:flutter/material.dart';
import 'Homepage.dart';
void main() {
  runApp(const Contact());
}


class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeActivity());
  }
}


class HomeActivity extends StatefulWidget {
  HomeActivity({super.key});
  @override
  State<StatefulWidget> createState() {
    return Homepage();
  }
}



