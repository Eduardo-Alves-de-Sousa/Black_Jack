class JogadorException implements Exception {
  final String mensagem;

  JogadorException(this.mensagem);

  @override
  String toString() => 'JogadorException: $mensagem';
}
