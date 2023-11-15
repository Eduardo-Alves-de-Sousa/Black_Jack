import 'package:flutter/material.dart';
import 'package:jogo/models/cartas.dart';

class CartaWidget extends StatelessWidget {
  final Cartas carta;

  const CartaWidget({super.key, required this.carta});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              carta.rank,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              carta.suit,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
