import 'package:flutter/material.dart';
import 'package:jogo/models/cartas.dart';

class CartaWidget extends StatelessWidget {
  final Cartas carta;
  final double width;
  final double height;

  const CartaWidget(this.carta,
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(4),
      color: const Color.fromARGB(255, 252, 252, 252),
      child: Center(
        child: Text(
          '${carta.rank} ${carta.emoji}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
