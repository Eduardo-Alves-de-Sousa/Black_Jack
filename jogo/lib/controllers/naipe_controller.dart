class Naipe {
  final String nome;
  final String emoji;

  // Construtor da classe Naipe
  const Naipe({
    required this.nome,
    required this.emoji,
  });

  @override
  String toString() {
    return nome;
  }
}
