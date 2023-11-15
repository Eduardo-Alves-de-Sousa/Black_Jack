import 'package:flutter/material.dart';
import 'package:jogo/models/jogador.dart';
import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/cartas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blackjack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackjack'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JogoBlackjack()),
            );
          },
          child: const Text('Jogar'),
        ),
      ),
    );
  }
}

class JogoBlackjack extends StatefulWidget {
  const JogoBlackjack({super.key});

  @override
  _JogoBlackjackState createState() => _JogoBlackjackState();
}

class _JogoBlackjackState extends State<JogoBlackjack> {
  late Baralho baralho;
  late Jogador jogador;
  late Jogador dealer;

  @override
  void initState() {
    super.initState();
    iniciarJogo();
  }

  void iniciarJogo() {
    baralho = Baralho();
    baralho.embaralhar();

    jogador = Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
    dealer = Jogador(nome: 'Dealer', mao: [], carteira: 0, aposta: 0);

    // Distribuir cartas iniciais
    jogador.receberCarta(baralho.pegarCarta());
    dealer.receberCarta(baralho.pegarCarta());
    jogador.receberCarta(baralho.pegarCarta());
    dealer.receberCarta(baralho.pegarCarta());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blackjack - Jogo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pontuação do Jogador: ${jogador.obterPontuacao()}'),
            const SizedBox(height: 16),
            const Text('Cartas do Jogador:'),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jogador.mao.length,
                itemBuilder: (context, index) {
                  return CartaWidget(jogador.mao[index]);
                },
              ),
            ),
            const SizedBox(height: 16),
            Text('Carta do Dealer: ${dealer.mao.isEmpty ? "" : dealer.mao[0]}'),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dealer.mao.isEmpty ? 0 : 1,
                itemBuilder: (context, index) {
                  return CartaWidget(dealer.mao[index]);
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  jogadorReceberCarta();
                });
              },
              child: const Text('Receber Carta'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  encerrarRodada();
                });
              },
              child: const Text('Encerrar Rodada'),
            ),
            if (jogador.obterPontuacao() == 21)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    encerrarRodada();
                  });
                },
                child: const Text('Jogador Vence (21 pontos)'),
              ),
            if (jogador.obterPontuacao() < 21)
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

  void jogadorReceberCarta() {
    jogador.receberCarta(baralho.pegarCarta());

    // Verificar se o jogador ultrapassou 21 pontos
    if (jogador.obterPontuacao() > 21) {
      // Implementar lógica para jogador perder
      // ignore: avoid_print
      print('Jogador perdeu!');
      iniciarJogo();
    }
  }

  void pararDeReceberCartas() {
    // Lógica para o dealer jogar
    while (dealer.obterPontuacao() < 17) {
      dealer.receberCarta(baralho.pegarCarta());
    }

    // Verificar o vencedor
    int pontuacaoJogador = jogador.obterPontuacao();
    int pontuacaoDealer = dealer.obterPontuacao();

    if (pontuacaoJogador > 21 ||
        (pontuacaoDealer <= 21 && pontuacaoDealer >= pontuacaoJogador)) {
      // Dealer vence
      // ignore: avoid_print
      print('Dealer vence!');
    } else {
      // Jogador vence
      // ignore: avoid_print
      print('Jogador vence!');
    }

    iniciarJogo();
  }

  void encerrarRodada() {
    // Lógica para o dealer jogar
    while (dealer.obterPontuacao() < 17) {
      dealer.receberCarta(baralho.pegarCarta());
    }

    // Verificar o vencedor
    int pontuacaoJogador = jogador.obterPontuacao();
    int pontuacaoDealer = dealer.obterPontuacao();

    if (pontuacaoJogador > 21 ||
        (pontuacaoDealer <= 21 && pontuacaoDealer >= pontuacaoJogador)) {
      // Dealer vence
      // ignore: avoid_print
      print('Dealer vence!');
    } else {
      // Jogador vence
      // ignore: avoid_print
      print('Jogador vence!');
    }

    iniciarJogo();
  }
}

class CartaWidget extends StatelessWidget {
  final Cartas carta;

  const CartaWidget(this.carta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      margin: const EdgeInsets.all(4),
      color: Colors.white,
      child: Center(
        child: Text(
          '${carta.rank} de ${carta.suit}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
