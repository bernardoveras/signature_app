import 'package:get/get.dart';

import '../viewmodels/assinatura_viewmodel.dart';

class AssinaturaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssinaturaViewModel());
  }
}
