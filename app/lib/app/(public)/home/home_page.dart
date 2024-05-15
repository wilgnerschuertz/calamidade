import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> filters = ['Geral', 'Casas', 'Saude', 'Animais', 'Abrigos', 'Ansiedade'];
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Solicitações',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: colors.black,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 20,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        indexSelected = index;
                      });
                    },
                    child: Text(
                      filters[index],
                      style: texts.bodyMedium?.copyWith(
                        color: index == indexSelected ? colors.otherGreen : colors.grey,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemCount: filters.length,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const CardRequest();
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
