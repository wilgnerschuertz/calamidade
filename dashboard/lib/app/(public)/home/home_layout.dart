import 'package:core_module/core_module.dart';
import 'package:dashboard/app/(public)/home/widgets/nav_bar/coo_nav_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: CooNavBar(),
          ),
          Expanded(
            flex: 8,
            child: RouterOutlet(),
          ),
          _RequestDetailsWidget(),
          // TODO - Separar em um componente e criar a tela com as informações ao clicar em um card
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     color: colors.white,
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Expanded(
          //                 child: Image(
          //                   image: CooImages.cooBanricoop,
          //                   width: MediaQuery.sizeOf(context).width * 0.05,
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.symmetric(horizontal: 8),
          //                 child: Icon(
          //                   CooIcons.plusSmall,
          //                   color: colors.primary,
          //                   size: MediaQuery.sizeOf(context).width * 0.01,
          //                 ),
          //               ),
          //               Expanded(
          //                 child: Image(
          //                   image: CooImages.cooBrand1,
          //                   width: MediaQuery.sizeOf(context).width * 0.05,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Column(
          //             children: [
          //               Text(
          //                 'R\$ 1,2 Milhão',
          //                 style: texts.headlineLarge?.copyWith(
          //                   color: colors.primary,
          //                   fontSize: 32,
          //                 ),
          //               ),
          //               Text(
          //                 'arrecadados',
          //                 style: texts.bodySmall,
          //               ),
          //               const SizedBox(height: 16),
          //               Text(
          //                 'R\$ 1 Milhão',
          //                 style: texts.headlineLarge?.copyWith(
          //                   color: colors.primary,
          //                 ),
          //               ),
          //               Text(
          //                 'CooPartilhados',
          //                 style: texts.bodySmall,
          //               ),
          //               const SizedBox(height: 16),
          //               Text(
          //                 '1.024',
          //                 style: texts.headlineLarge?.copyWith(
          //                   color: colors.primary,
          //                 ),
          //               ),
          //               Text(
          //                 'pessoas assistidas',
          //                 style: texts.bodySmall,
          //               ),
          //               const SizedBox(height: 16),
          //               Text(
          //                 'R\$ 200.024',
          //                 style: texts.headlineLarge?.copyWith(
          //                   color: colors.primary,
          //                 ),
          //               ),
          //               Text(
          //                 'em doações de parceiros',
          //                 style: texts.bodySmall,
          //               ),
          //             ],
          //           ),
          //           Image(
          //             image: CooImages.cooFlutterando1,
          //             width: MediaQuery.sizeOf(context).width * 0.4,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _RequestDetailsWidget extends StatelessWidget {
  const _RequestDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        color: Colors.amber,
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfoDetailTitle.title(
              label: 'Reconstrução do Telhado',
            ),
            InfoDetailTitle.subtitle(
              label: 'Dados Pessoais',
            ),
            InfoDetailRow(
              leftLabel: 'Nome:',
              rightLabel: 'João Maria da Silva',
            ),
            InfoDetailRow(
              leftLabel: 'Cidade:',
              rightLabel: 'Estância Velha',
            ),
            InfoDetailRow(
              leftLabel: 'Telefone:',
              rightLabel: '+55 (51) 9 1234-5678',
            ),
            InfoDetailTitle.subtitle(
              label: 'Dados Bancários',
            ),
            InfoDetailRow(
              leftLabel: 'Banco:',
              rightLabel: 'CooperBank',
            ),
            InfoDetailRow(
              leftLabel: 'Agência:',
              rightLabel: '5832',
            ),
            InfoDetailRow(
              leftLabel: 'Conta',
              rightLabel: '88832-01',
            ),
            InfoDetailRow(
              leftLabel: 'PIX',
              rightLabel: '123.456.789-10',
            ),
            const ImageDetail(
              paths: [],
            ),
            InfoDetailTitle.subtitle(
              label: 'Breve descrição',
            ),
            const DescriptionTextField(
              label:
                  'Olá, somos a família Silva, residentes da cidade de pelotas no Rio Grande do Sul e estamos passando por um momento difícil',
            ),
            const DetailButtonsWidget(),
          ],
        ),
      ),
    );
  }
}

class DetailButtonsWidget extends StatelessWidget {
  const DetailButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DetailButton(label: 'Rejeitar'),
        SizedBox(
          width: 10,
        ),
        DetailButton(label: 'Aceitar'),
      ],
    );
  }
}

class DetailButton extends StatelessWidget {
  const DetailButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.otherGreen,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Center(
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final styles = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      decoration: BoxDecoration(
        color: colors.lightGrey,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: Text(
        label,
        style: styles.titleSmall?.copyWith(
          color: colors.middleGrey,
        ),
      ),
    );
  }
}

class ImageDetail extends StatelessWidget {
  const ImageDetail({
    super.key,
    required this.paths,
  });

  final List<String> paths;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 187,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(
                        Icons.arrow_left,
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_right,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

typedef GetThemeStyle = TextStyle Function(TextTheme);

class InfoDetailTitle extends StatelessWidget {
  const InfoDetailTitle._({
    required this.label,
    required this.style,
  });

  final String label;
  final GetThemeStyle style;

  factory InfoDetailTitle.title({
    required String label,
  }) {
    return InfoDetailTitle._(
      label: label,
      style: (styles) => styles.displayMedium!,
    );
  }

  factory InfoDetailTitle.subtitle({
    required String label,
  }) {
    return InfoDetailTitle._(
      label: label,
      style: (styles) => styles.headlineMedium!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    return Text(
      label,
      style: style(styles),
    );
  }
}

class InfoDetailRow extends StatelessWidget {
  const InfoDetailRow._({
    required this.leftLabel,
    required this.rightLabel,
  });

  final String leftLabel;
  final String rightLabel;

  factory InfoDetailRow({
    required String leftLabel,
    required String rightLabel,
  }) {
    return InfoDetailRow._(
      leftLabel: leftLabel,
      rightLabel: rightLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final styles = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftLabel,
          style: styles.titleSmall?.copyWith(
            color: colors.middleGrey,
          ),
        ),
        Text(
          rightLabel,
          style: styles.titleSmall?.copyWith(
            color: colors.middleGrey,
          ),
        ),
      ],
    );
  }
}
