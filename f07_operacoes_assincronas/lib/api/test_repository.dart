class TestRepository {
  Future<String> fetchApiData() async {
    // Simula uma chamada de API com um atraso de 2 segundos
    await Future.delayed(Duration(seconds: 4));
    return 'Dados do servidor: Nome do usuário: John Doe, ID: 12345';
  }
}
