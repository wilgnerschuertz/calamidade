import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/app/features/home/interactor/home_state.dart';
import 'package:coopartilhar/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeInteractor = injector.get<HomeInteractor>();
  final List<CategoryHelp> categories = [
    CategoryHelp.general,
    CategoryHelp.houses,
    CategoryHelp.health,
    CategoryHelp.animals,
    CategoryHelp.shelters,
    CategoryHelp.anxiety,
  ];
  int indexCategorySelected = 0;

  @override
  void initState() {
    super.initState();
    homeInteractor.getOrders(categories[indexCategorySelected]);
  }

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
                        indexCategorySelected = index;
                      });
                      homeInteractor.getOrders(categories[indexCategorySelected]);
                    },
                    child: Text(
                      categories[index].label,
                      style: texts.bodyMedium?.copyWith(
                        color: index == indexCategorySelected ? colors.otherGreen : colors.grey,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemCount: categories.length,
              ),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
                valueListenable: homeInteractor,
                builder: (_, state, ____) {
                  return switch (state) {
                    HomeInitial() || HomeLoading() => const Center(child: CircularProgressIndicator()),
                    HomeSuccess(:final data) => Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final orderEntity = data[index];
                            return CardRequest(
                              value: orderEntity.value,
                              title: orderEntity.title,
                              helpedName: orderEntity.helpedName,
                              localName: orderEntity.localName,
                              dateString: DateAdapter.dateToString(orderEntity.date),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemCount: 5,
                        ),
                      ),
                    HomeError(:final exception) => Container(),
                    _ => Container(),
                  };
                })
          ],
        ),
      ),
    );
  }
}
