import 'package:flutter_test/flutter_test.dart';
import 'package:jogo/exceptions/jogador_exception.dart';
import 'package:jogo/historico_screen.dart';
import 'package:jogo/models/baralho.dart';
import 'package:jogo/models/cartas.dart';
import 'package:jogo/models/jogador.dart';
import 'package:jogo/models/partida.dart';

void main() {
  group('Partida', () {
    test('Iniciar Rodada', () {
      // Arrange
      final baralho = Baralho();
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final dealer =
          Jogador(nome: 'Dealer', mao: [], carteira: 1000, aposta: 0);
      final partida =
          Partida(dealer: dealer, jogador: jogador, baralho: baralho);

      // Act
      partida.iniciarRodada();

      // Assert
      expect(jogador.mao.length, 2);
      expect(dealer.mao.length, 2);
    });
    test('Jogador Receber Carta', () {
      // Arrange
      final baralho = Baralho();
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final dealer =
          Jogador(nome: 'Dealer', mao: [], carteira: 1000, aposta: 0);
      final partida =
          Partida(dealer: dealer, jogador: jogador, baralho: baralho);

      // Act
      partida.iniciarRodada();
      partida.jogadorReceberCarta();

      // Assert
      expect(jogador.mao.length, 3);
    });
    test('Encerrar Rodada', () {
      final baralho = Baralho();
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final dealer =
          Jogador(nome: 'Dealer', mao: [], carteira: 1000, aposta: 0);
      final partida =
          Partida(dealer: dealer, jogador: jogador, baralho: baralho);

      partida.iniciarRodada();
      partida.encerrarRodada();
    });

    test('Receber Carta após o encerramento da rodada não deve causar erro',
        () {
      // Arrange
      final baralho = Baralho();
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final dealer =
          Jogador(nome: 'Dealer', mao: [], carteira: 1000, aposta: 0);
      final partida =
          Partida(dealer: dealer, jogador: jogador, baralho: baralho);

      // Act
      partida.iniciarRodada();
      partida.encerrarRodada();
      partida.jogadorReceberCarta();

      // Assert
      // Não deve haver erro ao receber uma carta após o encerramento da rodada
    });
  });
  group('Cartas', () {
    test('Construtor deve criar instância válida', () {
      final carta = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      expect(carta, isA<Cartas>());
      expect(carta.suit, 'Copas');
      expect(carta.rank, 'Ás');
      expect(carta.emoji, '❤️');
    });
    test('Método toString deve retornar representação correta', () {
      final carta = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      final resultadoToString = carta.toString();
      expect(resultadoToString, 'Ás de Copas ❤️');
    });
  });
  group('Historico', () {
    test('Adicionar jogo deve adicionar um item ao histórico', () {
      Historico.adicionarJogo(
        nomeJogador: 'Jogador1',
        pontuacao: 15,
        resultado: 'Vitória',
        empate: false,
      );

      expect(Historico.historico.length, equals(1));
    });
  });
  group('Jogador', () {
    test('Receber Carta deve adicionar a carta à mão do jogador', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final carta = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');

      // Act
      jogador.receberCarta(carta);

      // Assert
      expect(jogador.mao.length, equals(1));
      expect(jogador.mao.contains(carta), isTrue);
    });

    test('Limpar Mão deve remover todas as cartas da mão do jogador', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final carta1 = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      final carta2 = Cartas(suit: 'Paus', rank: '10', emoji: '🔟');

      jogador.receberCarta(carta1);
      jogador.receberCarta(carta2);

      // Act
      jogador.limparMao();

      // Assert
      expect(jogador.mao.isEmpty, isTrue);
    });

    test('Ajustar Aposta deve atualizar o valor da aposta do jogador', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);

      // Act
      jogador.ajustarAposta(50);

      // Assert
      expect(jogador.aposta, equals(50));
    });

    test('Ajustar Aposta não deve permitir apostas negativas', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);

      // Act & Assert
      expect(
          () => jogador.ajustarAposta(-10), throwsA(isA<JogadorException>()));
    });

    test('Ajustar Aposta não deve permitir apostas superiores à carteira', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);

      // Act & Assert
      expect(
          () => jogador.ajustarAposta(1100), throwsA(isA<JogadorException>()));
    });

    test('Ajustar Carteira deve atualizar o valor da carteira do jogador', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);

      // Act
      jogador.ajustarCarteira(1200);

      // Assert
      expect(jogador.carteira, equals(1200));
    });

    test('Ajustar Carteira não deve permitir valores negativos', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);

      // Act & Assert
      expect(() => jogador.ajustarCarteira(-200),
          throwsA(isA<JogadorException>()));
    });

    test('Obter Pontuação deve calcular a pontuação correta da mão', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final carta1 = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      final carta2 = Cartas(suit: 'Paus', rank: '10', emoji: '🔟');

      jogador.receberCarta(carta1);
      jogador.receberCarta(carta2);

      // Act
      final pontuacao = jogador.obterPontuacao();

      // Assert
      expect(pontuacao, equals(21));
    });

    test('Obter Pontuação deve ajustar o valor dos Ases corretamente', () {
      // Arrange
      final jogador =
          Jogador(nome: 'Jogador', mao: [], carteira: 1000, aposta: 0);
      final carta1 = Cartas(suit: 'Copas', rank: 'Ás', emoji: '❤️');
      final carta2 = Cartas(suit: 'Paus', rank: '10', emoji: '🔟');
      final carta3 = Cartas(suit: 'Ouros', rank: 'Ás', emoji: '❤️');

      jogador.receberCarta(carta1);
      jogador.receberCarta(carta2);
      jogador.receberCarta(carta3);

      // Act
      final pontuacao = jogador.obterPontuacao();

      // Assert
      expect(pontuacao, equals(12)); // 11 (Ás) + 10 + 1 (Ás ajustado)
    });
  });
}
