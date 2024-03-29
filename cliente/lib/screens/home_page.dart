import 'package:command_app_frontend/screens/book_table.dart';
import 'package:command_app_frontend/screens/menu.dart';
import 'package:flutter/material.dart';

import '../session.dart';
import '../widgets/home_page_sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<HomeSection> sections = <HomeSection>[
      HomeSection("Prenota", "chair", () {
        order.tableID = "P";
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BookTable()),
        );
      }),
      HomeSection("Asporto", "take-away", () {
        order.tableID = "A";
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Menu()),
        );
      }),
      HomeSection("Delivery", "delivery-man", () {
        order.tableID = "D";
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Menu()),
        );
      }),
    ];

    return HomePageSections(sections);
  }
}
