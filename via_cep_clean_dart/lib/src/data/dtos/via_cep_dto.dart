import 'package:via_cep_clean_dart/src/domain/entities/via_cep_entity.dart';

class ViaCepDto extends ViaCepEntity {
  @override
  String cep;
  @override
  String? logradouro;
  @override
  String? complemento;
  @override
  String? bairro;
  @override
  String localidade;
  @override
  String uf;
  @override
  String ibge;
  @override
  String? gia;
  @override
  String ddd;
  @override
  String siafi;

  ViaCepDto(
      {required this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      required this.localidade,
      required this.uf,
      required this.ibge,
      this.gia,
      required this.ddd,
      required this.siafi})
      : super(
            cep: cep,
            logradouro: logradouro,
            complemento: complemento,
            bairro: bairro,
            localidade: localidade,
            uf: uf,
            ibge: ibge,
            gia: gia,
            ddd: ddd,
            siafi: siafi);

  Map toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro ?? '',
      'complemento': complemento ?? '',
      'bairro': bairro ?? '',
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia ?? 0,
      'ddd': ddd,
      'siafi': siafi
    };
  }

  static ViaCepDto fromMap(Map map) {
    return ViaCepDto(
      cep: map['cep'],
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'],
      uf: map['uf'],
      ibge: map['ibge'],
      gia: map['gia'] ?? '',
      ddd: map['ddd'],
      siafi: map['siafi'],
    );
  }
}
