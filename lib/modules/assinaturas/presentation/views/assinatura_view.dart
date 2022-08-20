import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../viewmodels/assinatura_viewmodel.dart';

class AssinaturaView extends StatefulWidget {
  const AssinaturaView({Key? key}) : super(key: key);

  @override
  State<AssinaturaView> createState() => _AssinaturaViewState();
}

class _AssinaturaViewState extends State<AssinaturaView> {
  AssinaturaViewModel get viewModel => Get.find<AssinaturaViewModel>();

  bool contemAssinatura = false;

  late final SignatureController _signatureController;

  void limparAssinatura() {
    _signatureController.undo();
  }

  Future<void> salvar(BuildContext context) async {
    if (!contemAssinatura) {
      ScaffoldMessenger.of(this.context).showSnackBar(
        const SnackBar(
          content: Text('Não há assinatura para ser salva'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final Uint8List? assinatura = await _signatureController.toPngBytes();

    if (assinatura == null) {
      ScaffoldMessenger.of(this.context).showSnackBar(
        const SnackBar(
          content: Text('Não foi possível salvar a assinatura'),
          backgroundColor: Colors.red,
        ),
      );
    }

    final bool success = await viewModel.salvar(assinatura!, _signatureController.points);

    if (success) {
      Navigator.pop(this.context, true);
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(
          content: Text(viewModel.modoInclusao ? 'Assinatura salva com sucesso' : 'Assinatura alterada com sucesso'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void initState() {
    _signatureController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      exportPenColor: Colors.black,
      points: viewModel.model?.points ?? [],
    );

    _signatureController.addListener(() {
      if (contemAssinatura != _signatureController.isNotEmpty) {
        setState(() {
          contemAssinatura = _signatureController.isNotEmpty;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: viewModel.modoEdicao ? const Text('Editar Assinatura') : const Text('Nova Assinatura'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            disabledColor: Colors.white.withOpacity(0.5),
            onPressed: contemAssinatura ? () => salvar(context) : null,
          ),
        ],
      ),
      floatingActionButton: !contemAssinatura
          ? null
          : FloatingActionButton(
              onPressed: () => limparAssinatura(),
              tooltip: 'Limpar assinatura',
              child: const Icon(Icons.undo),
            ),
      body: LayoutBuilder(builder: (context, contraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                height: contraints.maxHeight * 0.4,
                width: contraints.maxWidth * 0.8,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withOpacity(0.15),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: contraints.maxHeight * 0.6,
              width: contraints.maxWidth * 0.85,
              child: Signature(
                controller: _signatureController,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        );
      }),
    );
  }
}
