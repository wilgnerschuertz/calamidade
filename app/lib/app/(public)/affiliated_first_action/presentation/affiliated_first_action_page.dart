import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AffiliatedFirstActionPage extends StatefulWidget {
  const AffiliatedFirstActionPage({super.key});

  @override
  State<AffiliatedFirstActionPage> createState() => _AffiliatedFirstActionPageState();
}

class _AffiliatedFirstActionPageState extends State<AffiliatedFirstActionPage> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _cpfOrCnpj;
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _location;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();

    _cpfOrCnpj = TextEditingController();
    _name = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _location = TextEditingController();
  }

  @override
  void dispose() {
    _cpfOrCnpj.dispose();
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _location.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      print('OK!');
    }
    print('OPS!');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsTheme = CoopartilharColors.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/pngs/background_details.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Image.asset(
                            'assets/splash/logo_splash.png',
                            width: 150,
                            height: 124,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informar Assistido',
                            style: textTheme.displayLarge?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'CPF/CNPJ',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _cpfOrCnpj,
                            decoration: const InputDecoration(
                              hintText: 'Informe seu CPF/CNPJ',
                            ),
                            validator: (String? value) => (value == null || value.isEmpty) ? 'CPF/CNPJ não pode esta vazio' : null,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Nome Completo',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _name,
                            decoration: const InputDecoration(
                              hintText: 'Insira seu nome completo',
                            ),
                            validator: (String? value) => (value == null || value.isEmpty) ? 'Nome não pode esta vazio' : null,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'E-mail',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: 'Insira seu e-mail',
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'E-mail não pode esta vazio';
                              }

                              if (!value.contains('@') && !value.contains('.')) {
                                return 'Esse campo precisa ser um e-mail valido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Telefone',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _phone,
                            decoration: const InputDecoration(
                              hintText: 'Insira seu número de telefone',
                          
                            validator: (String? value) => (value == null || value.isEmpty) ? 'Telefone não pode esta vazio' : null,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Localização (geo/endereço)',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorsTheme.textColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _location,
                                  decoration: const InputDecoration(
                                    hintText: 'Insira sua localização',
                                  ),
                                  validator: (String? value) => (value == null || value.isEmpty) ? 'Localização não pode esta vazio' : null,
                                ),
                              ),
                              SizedBox(
                                height: 52,
                                child: CooButton.primary(
                                  icon: Icons.place,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 63),
                          SizedBox(
                            height: 56,
                            child: CooButton.primary(
                              onPressed: _register,
                              label: 'Próximo',
                            ),
                          ),
                          const SizedBox(height: 48),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
