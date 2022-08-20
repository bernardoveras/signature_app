// ignore_for_file: non_constant_identifier_names
import 'package:get/get.dart';

import '../modules/assinaturas/presentation/bindings/assinatura_binding.dart';
import '../modules/assinaturas/presentation/views/assinatura_list_view.dart';
import '../modules/assinaturas/presentation/views/assinatura_view.dart';
import '../modules/home/presentation/views/home_view.dart';

class AppRoutes {
  const AppRoutes._();

  static String get initialRoute => home;

  static String get home => '/';
  static String get assinaturas => '/assinaturas';
  static String get assinatura_inclusao => '$assinaturas/add';
  static String get assinatura_edicao => '$assinaturas/:id';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: assinaturas,
      page: () => const AssinaturaListView(),
    ),
    GetPage(
      name: assinatura_inclusao,
      binding: AssinaturaBinding(),
      page: () => const AssinaturaView(),
    ),
    GetPage(
      name: assinatura_edicao,
      binding: AssinaturaBinding(),
      page: () => const AssinaturaView(),
    ),
  ];
}
