// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jogo/models/jogador.dart';
import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/cartas.dart';

class JogoBlackjack extends StatefulWidget {
  const JogoBlackjack({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _JogoBlackjackState createState() => _JogoBlackjackState();
}

class _JogoBlackjackState extends State<JogoBlackjack> {
  late Baralho baralho;
  late Jogador jogador1;
  late Jogador jogador2;

  @override
  void initState() {
    super.initState();
    iniciarJogo();
  }

  void iniciarJogo() {
    baralho = Baralho();
    baralho.embaralhar();

    jogador1 = Jogador(nome: 'Jogador 1', mao: [], carteira: 1000, aposta: 0);
    jogador2 = Jogador(nome: 'Jogador 2', mao: [], carteira: 1000, aposta: 0);

    // Distribuir cartas iniciais
    jogador1.receberCarta(baralho.pegarCarta());
    jogador2.receberCarta(baralho.pegarCarta());
    jogador1.receberCarta(baralho.pegarCarta());
    jogador2.receberCarta(baralho.pegarCarta());
  }

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 80;
    const double cardHeight = 120;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackjack - Jogo'),
      ),
      backgroundColor: const Color(0xFF2E7D32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pontuação do Jogador 1: ${jogador1.obterPontuacao()}'),
            const SizedBox(height: 16),
            const Text('Cartas do Jogador 1:'),
            SizedBox(
              height: cardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jogador1.mao.length,
                itemBuilder: (context, index) {
                  return CartaWidget(jogador1.mao[index],
                      width: cardWidth, height: cardHeight);
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  jogadorReceberCarta(jogador1);
                });
              },
              child: const Text('Jogador 1 - Receber Carta'),
            ),
            const SizedBox(height: 32),
            Text('Pontuação do Jogador 2: ${jogador2.obterPontuacao()}'),
            const SizedBox(height: 16),
            const Text('Cartas do Jogador 2:'),
            SizedBox(
              height: cardHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jogador2.mao.length,
                itemBuilder: (context, index) {
                  return CartaWidget(jogador2.mao[index],
                      width: cardWidth, height: cardHeight);
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  jogadorReceberCarta(jogador2);
                });
              },
              child: const Text('Jogador 2 - Receber Carta'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  encerrarRodada();
                });
              },
              child: const Text('Encerrar Rodada'),
            ),
            if (jogador1.obterPontuacao() == 21 ||
                jogador2.obterPontuacao() == 21)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    encerrarRodada();
                  });
                },
                child: const Text('Jogador Vence (21 pontos)'),
              ),
            if (jogador1.obterPontuacao() < 21 ||
                jogador2.obterPontuacao() < 21)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pararDeReceberCartas();
                  });
                },
                child: const Text('Parar de Receber Cartas'),
              ),
          ],
        ),
      ),
    );
  }

  void jogadorReceberCarta(Jogador jogador) {
    jogador.receberCarta(baralho.pegarCarta());

    // Verificar se o jogador ultrapassou 21 pontos
    if (jogador.obterPontuacao() > 21) {
      // ignore: avoid_print
      print('${jogador.nome} perdeu!');
      iniciarJogo();
    }
  }

  void pararDeReceberCartas() {
    // Lógica para os jogadores jogarem
    while (jogador1.obterPontuacao() < 17 || jogador2.obterPontuacao() < 17) {
      if (jogador1.obterPontuacao() < 17) {
        jogadorReceberCarta(jogador1);
      }
      if (jogador2.obterPontuacao() < 17) {
        jogadorReceberCarta(jogador2);
      }
    }

    // Verificar o vencedor
    int pontuacaoJogador1 = jogador1.obterPontuacao();
    int pontuacaoJogador2 = jogador2.obterPontuacao();

    if ((pontuacaoJogador1 > 21 && pontuacaoJogador2 > 21) ||
        (pontuacaoJogador1 <= 21 &&
            pontuacaoJogador2 <= 21 &&
            pontuacaoJogador2 >= pontuacaoJogador1)) {
      // ignore: avoid_print
      print('Jogador 2 vence!');
    } else {
      // ignore: avoid_print
      print('Jogador 1 vence!');
    }

    iniciarJogo();
  }

  void encerrarRodada() {
    // Lógica para os jogadores jogarem
    while (jogador1.obterPontuacao() < 17 || jogador2.obterPontuacao() < 17) {
      if (jogador1.obterPontuacao() < 17) {
        jogadorReceberCarta(jogador1);
      }
      if (jogador2.obterPontuacao() < 17) {
        jogadorReceberCarta(jogador2);
      }
    }

    // Verificar o vencedor
    int pontuacaoJogador1 = jogador1.obterPontuacao();
    int pontuacaoJogador2 = jogador2.obterPontuacao();

    if ((pontuacaoJogador1 > 21 && pontuacaoJogador2 > 21) ||
        (pontuacaoJogador1 <= 21 &&
            pontuacaoJogador2 <= 21 &&
            pontuacaoJogador2 >= pontuacaoJogador1)) {
      // ignore: avoid_print
      print('Jogador 2 vence!');
    } else {
      // ignore: avoid_print
      print('Jogador 1 vence!');
    }

    iniciarJogo();
  }
}

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
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
