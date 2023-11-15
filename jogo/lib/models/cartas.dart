class Cartas {
  final String suit;
  final String rank;
  final String emoji;

  // Construtor da classe Cartas
  Cartas({required this.suit, required this.rank, required this.emoji});

  // Sobrescrita do método toString para facilitar a exibição
  @override
  String toString() {
    return '$rank de $suit $emoji';
  }

  // Método estático para embaralhar uma lista de cartas
  static List<Cartas> embaralhar(List<Cartas> cartas) {
    cartas.shuffle();
    return cartas;
  }
}
