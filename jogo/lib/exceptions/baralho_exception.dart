class BaralhoVazioException implements Exception {
  final String mensagem;

  BaralhoVazioException(this.mensagem);

  @override
  String toString() {
    return 'BaralhoVazioException: $mensagem';
  }
}
