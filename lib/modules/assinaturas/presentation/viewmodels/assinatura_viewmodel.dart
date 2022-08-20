import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../../../shared/settings.dart';
import '../../dominio/dtos/assinatura_dto.dart';

class AssinaturaViewModel extends GetxController {
  AssinaturaDto? model;

  bool modoInclusao = false;
  bool modoEdicao = false;

  Future<bool> salvar(Uint8List assinatura, List<Point> points) async {
    if (modoInclusao) {
      model = AssinaturaDto(
        id: '${Settings.assinaturas.length + 1}',
        assinatura: assinatura,
        dataInclusao: DateTime.now(),
        nome: 'Teste ${Settings.assinaturas.length + 1}',
        dataAlteracao: null,
        points: points,
      );

      if (Settings.assinaturas.any((x) => x.nome == model!.nome)) {
        debugPrint('Assinatura já existe');
        return false;
      }

      Settings.assinaturas.add(model!);
      return true;
    }

    if (modoEdicao) {
      if (model == null || !Settings.assinaturas.any((x) => x.nome == model!.nome)) {
        debugPrint('Assinatura não encontrado');
        return false;
      }

      model!.dataAlteracao = DateTime.now();

      Settings.assinaturas.removeWhere((x) => x.id == model!.id);
      Settings.assinaturas.add(model!);

      return true;
    }

    return false;
  }

  AssinaturaDto? obterAssinaturaPorId(String id) {
    var assinatura = Settings.assinaturas.firstWhereOrNull((x) => x.id == id);
    return assinatura;
  }

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    var parameters = Get.parameters;

    if (parameters.containsKey('id')) {
      modoEdicao = true;
      modoInclusao = false;
      final String idAssinatura = parameters['id']!;
      model = obterAssinaturaPorId(idAssinatura);
    } else {
      modoInclusao = true;
    }

    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onClose();
  }
}
