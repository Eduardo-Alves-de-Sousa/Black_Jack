import 'package:flutter/material.dart';
import 'package:jogo/historico_screen.dart';
import 'carta_widget.dart';
import 'package:jogo/models/jogador.dart';
import 'package:jogo/models/baralho.dart';

class JogoBlackjack extends StatefulWidget {
  final String nomeJogador1;
  final String nomeJogador2;

  const JogoBlackjack(this.nomeJogador1, this.nomeJogador2, {Key? key})
      : super(key: key);

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

    jogador1 =
        Jogador(nome: widget.nomeJogador1, mao: [], carteira: 1000, aposta: 0);
    jogador2 =
        Jogador(nome: widget.nomeJogador2, mao: [], carteira: 1000, aposta: 0);

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
        backgroundColor: Colors.green,
      ),
      backgroundColor: const Color(0xFF2E7D32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pontuação do ${jogador1.nome}: ${jogador1.obterPontuacao()}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cartas do Jogador 1:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Jogador 1 - Receber Carta'),
            ),
            const SizedBox(height: 32),
            Text(
              'Pontuação do ${jogador2.nome}: ${jogador2.obterPontuacao()}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cartas do Jogador 2:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Jogador 2 - Receber Carta'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  encerrarRodada();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Encerrar Rodada'),
            ),
            const SizedBox(height: 20),
            if (jogador1.obterPontuacao() == 21 ||
                jogador2.obterPontuacao() == 21)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mostrarResultadoDialog();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 16),
                ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  textStyle: const TextStyle(fontSize: 16),
                ),
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
      mostrarResultadoDialog();
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

    if (pontuacaoJogador1 > 21 && pontuacaoJogador2 > 21) {
      // ignore: avoid_print
      print('Empate!');
    } else if (pontuacaoJogador1 <= 21 && pontuacaoJogador2 <= 21) {
      if (pontuacaoJogador1 == pontuacaoJogador2) {
        // ignore: avoid_print
        print('Empate!');
      } else if (pontuacaoJogador2 > pontuacaoJogador1) {
        // ignore: avoid_print
        print('${jogador2.nome} vence!');
      } else {
        // ignore: avoid_print
        print('${jogador1.nome} vence!');
      }
    } else if (pontuacaoJogador1 > 21) {
      // ignore: avoid_print
      print('${jogador2.nome} vence!');
    } else {
      // ignore: avoid_print
      print('${jogador1.nome} vence!');
    }

    mostrarResultadoDialog();
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

    if (pontuacaoJogador1 > 21 && pontuacaoJogador2 > 21) {
      // ignore: avoid_print
      print('Empate!');
    } else if (pontuacaoJogador1 <= 21 && pontuacaoJogador2 <= 21) {
      if (pontuacaoJogador1 == pontuacaoJogador2) {
        // ignore: avoid_print
        print('Empate!');
      } else if (pontuacaoJogador2 > pontuacaoJogador1) {
        // ignore: avoid_print
        print('${jogador2.nome} vence!');
      } else {
        // ignore: avoid_print
        print('${jogador1.nome} vence!');
      }
    } else if (pontuacaoJogador1 > 21) {
      // ignore: avoid_print
      print('${jogador2.nome} vence!');
    } else {
      // ignore: avoid_print
      print('${jogador1.nome} vence!');
    }

    mostrarResultadoDialog();
  }

  void mostrarResultadoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado da Partida'),
          content: Text(
            'Pontuação ${jogador1.nome}: ${jogador1.obterPontuacao()}\n'
            'Pontuação ${jogador2.nome}: ${jogador2.obterPontuacao()}\n\n'
            'Deseja continuar jogando?',
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo

                // Adicionar informações ao histórico
                adicionarAoHistorico(jogador1);
                adicionarAoHistorico(jogador2);

                iniciarJogo(); // Iniciar um novo jogo
                setState(() {}); // Atualizar a interface
              },
              child: const Text('Sim'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo

                // Adicionar informações ao histórico
                adicionarAoHistorico(jogador1);
                adicionarAoHistorico(jogador2);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoricoScreen(),
                  ),
                );
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }

  void adicionarAoHistorico(Jogador jogador) {
    String resultado = 'Derrota';

    // Verificar se o jogador venceu
    if ((jogador == jogador1 && jogador1.obterPontuacao() <= 21) &&
        (jogador2.obterPontuacao() > 21 ||
            jogador1.obterPontuacao() > jogador2.obterPontuacao())) {
      resultado = 'Vitória';
    } else if ((jogador == jogador2 && jogador2.obterPontuacao() <= 21) &&
        (jogador1.obterPontuacao() > 21 ||
            jogador2.obterPontuacao() > jogador1.obterPontuacao())) {
      resultado = 'Vitória';
    } else if (jogador1.obterPontuacao() <= 21 &&
        jogador2.obterPontuacao() <= 21) {
      if (jogador1.obterPontuacao() == jogador2.obterPontuacao()) {
        resultado = 'Empate';
      } else if (jogador1.obterPontuacao() > jogador2.obterPontuacao()) {
        resultado = 'Vitória';
      }
    }

    Historico.adicionarJogo(
      nomeJogador: jogador.nome,
      pontuacao: jogador.obterPontuacao(),
      resultado: resultado,
      empate: resultado == 'Empate',
    );
  }
}
