import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewAskHelpPage extends StatefulWidget {
  const NewAskHelpPage({super.key, this.title = 'Solicitação'});
  final String title;

  @override
  State<NewAskHelpPage> createState() => _NewAskHelpPageState();
}

class _NewAskHelpPageState extends State<NewAskHelpPage> {
  String preApprovedValue = '5.500,00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Valor pré-aprovado'),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    decoration: BoxDecoration(
                        color: CoopartilharColors.of(context).lightGrey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Text(
                      'R\$ $preApprovedValue',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CoopartilharColors.of(context).primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Titulo da solicitação*'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('CPF do Assistido*'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Chave pix'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Banco'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Agência'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Conta'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Valor*'),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Enviar arquivo'),
              const SizedBox(height: 10),
              const Text('Breve descrição'),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
