import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/appbar.dart';
import 'package:ii_cpi_project/constantes/ListFihaDesPostsNsayiwBihom.dart';
import 'package:ii_cpi_project/constantes/colors.dart';
import 'package:ii_cpi_project/screens/create_offer.dart';

class Offers extends StatefulWidget {
  static bool createPostVisible = false;
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Posts[0] = HomeAppBar(
      scrollController: scrollController,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: ActiveColor,
          child: Icon(
            !Offers.createPostVisible ? Icons.post_add_rounded : Icons.cancel,
            size: 40,
            color: Colors.white,
          ),
          onPressed: _appearenceOfCreateOffer),
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: Posts,
          ),
          Offers.createPostVisible ? TrajetBox() : Container(),
        ],
      ),
    );
  }

  void _appearenceOfCreateOffer() {
    setState(() {
      Offers.createPostVisible = !Offers.createPostVisible;
    });
  }
}
