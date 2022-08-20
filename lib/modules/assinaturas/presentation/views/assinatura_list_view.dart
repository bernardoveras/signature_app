import 'package:flutter/material.dart';

import '../../../../shared/routes.dart';
import '../../../../shared/settings.dart';
import '../../../../shared/theme/app_color.dart';

class AssinaturaListView extends StatefulWidget {
  const AssinaturaListView({Key? key}) : super(key: key);

  @override
  State<AssinaturaListView> createState() => _AssinaturaListViewState();
}

class _AssinaturaListViewState extends State<AssinaturaListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assinaturas'),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final alterou = await Navigator.pushNamed(context, AppRoutes.assinatura_inclusao);

          if (alterou == true) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: Settings.assinaturas.length,
        itemBuilder: (_, i) {
          var assinatura = Settings.assinaturas[i];
          return ListTile(
            onTap: () async {
              final alterou = await Navigator.pushNamed(context, AppRoutes.assinatura_edicao.replaceAll(':id', assinatura.id));

              if (alterou == true) {
                setState(() {});
              }
            },
            title: Text(
              'Teste $i',
              style: TextStyle(
                color: AppColor.grey01,
              ),
            ),
            trailing: Icon(
              Icons.more_vert,
              color: AppColor.grey01,
            ),
          );
        },
      ),
    );
  }
}
