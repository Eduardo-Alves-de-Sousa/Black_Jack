// ignore: file_names
import 'package:flutter/material.dart';
import 'package:jogo/models/cartas.dart';
import 'dart:math';

class AnimatedCardWidget extends StatefulWidget {
  final Cartas carta;

  const AnimatedCardWidget({Key? key, required this.carta}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedCardWidgetState createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedCard(Cartas carta) {
    return SizedBox(
      height: 350, // Ajuste a altura conforme necessário
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(_animation.value * pi),
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(
                12.0), // Aumente o valor do padding conforme necessário
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  carta.rank,
                  style: const TextStyle(
                      fontSize:
                          30), // Ajuste o tamanho da fonte conforme necessário
                ),
                Text(
                  carta.emoji,
                  style: const TextStyle(
                      fontSize:
                          30), // Ajuste o tamanho da fonte conforme necessário
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimatedCard(widget.carta);
  }
}
