import 'package:flutter/material.dart';

import '../../../../shared/componentes/base_card.dart';
import '../../../../shared/routes.dart';
import '../../../../shared/utils/screen_util.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double kAppBarHeight = ScreenUtil.height(context) * 0.2;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        toolbarHeight: kAppBarHeight,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              '04 de Fev, 2019',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Bem-vindo(a) de volta,',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Leandro Silva',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: ScreenUtil.height(context) - kAppBarHeight,
        width: ScreenUtil.width(context),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ActionCard(
                  titulo: 'Assinar',
                  icon: Icons.drive_file_rename_outline_outlined,
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.assinaturas),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    Key? key,
    required this.titulo,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final String titulo;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: BaseCard(
        padding: const EdgeInsets.symmetric(vertical: 16),
        height: 120,
        width: 120,
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF43425D),
              size: 32,
            ),
            Text(
              titulo,
              style: const TextStyle(
                color: Color(0xFF43425D),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
