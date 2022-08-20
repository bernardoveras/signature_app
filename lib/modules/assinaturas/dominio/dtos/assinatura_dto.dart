import 'dart:typed_data';

import 'package:signature/signature.dart';

class AssinaturaDto {
  AssinaturaDto({
    required this.id,
    required this.nome,
    required this.dataInclusao,
    this.dataAlteracao,
    required this.assinatura,
    required this.points,
  });

  final String id;
  String nome;
  final Uint8List assinatura;
  final List<Point> points;
  final DateTime dataInclusao;
  DateTime? dataAlteracao;
}
