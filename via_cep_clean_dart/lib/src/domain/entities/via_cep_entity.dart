class ViaCepEntity {
  final String cep;
  final String? logradouro;
  final String? complemento;
  final String? bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String? gia;
  final String ddd;
  final String siafi;

  ViaCepEntity({
    required this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    required this.localidade,
    required this.uf,
    required this.ibge,
    this.gia,
    required this.ddd,
    required this.siafi,
  });
}
