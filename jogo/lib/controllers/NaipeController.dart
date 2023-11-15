import 'package:jogo/models/naipe.dart';

class NaipeController {
  // Método para criar uma instância de Naipe
  static Naipe criarNaipe(String nome) {
    return Naipe(nome);
  }

  // Exemplo de método para verificar se dois naipes são iguais
  static bool saoIguais(Naipe naipe1, Naipe naipe2) {
    return naipe1.nome == naipe2.nome;
  }

  // Outras operações relacionadas ao Naipe podem ser adicionadas conforme necessário
}
