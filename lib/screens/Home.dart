import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/Drawer.dart';
import 'package:ii_cpi_project/constantes/Colors.dart';
import 'package:ii_cpi_project/screens/Profile.dart';

import 'Demandes.dart';
import 'Offers.dart';

class Home extends StatefulWidget {
  static PageController index = PageController(initialPage: 0);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;
  PageController index;
  @override
  Widget build(BuildContext context) {
    index = Home.index;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(), //   components/appbar.dart
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: selected == 0 ? ActiveColor : Colors.grey,
                  ),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      selected = 0;
                      index.jumpToPage(0);
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.contacts_rounded,
                    color: selected == 1 ? ActiveColor : Colors.grey,
                  ),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      index.jumpToPage(1);
                      selected = 1;
                    });
                  }),
              IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: selected == 2 ? ActiveColor : Colors.grey,
                  ),
                  iconSize: 36,
                  onPressed: () {
                    setState(() {
                      index.jumpToPage(2);
                      selected = 2;
                    });
                  }),
            ],
          ),
        ),
        body: PageView(
          onPageChanged: (ind) {
            setState(() {
              selected = ind;
            });
          },
          controller: index,
          children: [
            Offers(),
            DemandesScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
