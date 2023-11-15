class Cartas {
  final String suit;
  final String rank;

  // Construtor da classe Cartas
  Cartas({required this.suit, required this.rank});

  // Sobrescrita do método toString para facilitar a exibição
  @override
  String toString() {
    return '$rank of $suit';
  }

  // Método estático para embaralhar uma lista de cartas
  static List<Cartas> embaralhar(List<Cartas> cartas) {
    // Utilizando o método shuffle da classe List para embaralhar as cartas
    cartas.shuffle();
    return cartas;
  }
}
