class PartidaException implements Exception {
  final String mensagem;

  PartidaException(this.mensagem);

  @override
  String toString() => 'PartidaException: $mensagem';
}
