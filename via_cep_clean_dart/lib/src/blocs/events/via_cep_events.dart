abstract class ViaCepEvents {}

class GetCepEvent extends ViaCepEvents {
  final String cep;

  GetCepEvent({
    required this.cep,
  });
}
