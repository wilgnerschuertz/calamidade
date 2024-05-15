import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewAskHelpPage extends StatefulWidget {
  const NewAskHelpPage({super.key, this.title = 'Solicitação'});
  final String title;

  @override
  State<NewAskHelpPage> createState() => _NewAskHelpPageState();
}

class _NewAskHelpPageState extends State<NewAskHelpPage> {
  final _formKey = GlobalKey<FormState>();
  String preApprovedValue = '7.500,00';

  TextEditingController titleController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController pixKeyController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController agencyController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    cpfController.dispose();
    pixKeyController.dispose();
    bankController.dispose();
    agencyController.dispose();
    accountController.dispose();
    valueController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor pré-aprovado',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
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
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Insira o titulo para solicitação',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('CPF do Assistido*'),
                TextFormField(
                  controller: cpfController,
                  decoration: const InputDecoration(
                    hintText: 'Insira o CPF do Assistido',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Chave pix'),
                TextFormField(
                  controller: pixKeyController,
                  decoration: const InputDecoration(
                    hintText: 'Insira a chave pix do Assistido',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Banco'),
                TextFormField(
                  controller: bankController,
                  decoration: const InputDecoration(
                    hintText: 'Insira o banco do Assistido',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Agência'),
                TextFormField(
                  controller: agencyController,
                  decoration: const InputDecoration(
                    hintText: 'Insira a agência bancária do Assistido',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Conta'),
                TextFormField(
                  controller: accountController,
                  decoration: const InputDecoration(
                    hintText: 'Insira a conta bancária do Assistido',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Valor*'),
                TextFormField(
                  controller: valueController,
                  decoration: const InputDecoration(
                    hintText: 'R\$ 14.500,00',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Enviar arquivo'),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.closed_caption_off)),
                const SizedBox(height: 10),
                const Text('Breve descrição'),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText:
                        'Insira uma breve descrição sobre sua solicitação',
                  ),
                ),
                const SizedBox(height: 50),
                CooButton(label: 'Proximo', onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
