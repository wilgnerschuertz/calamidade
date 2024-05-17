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
  final List<TagType> categories = [
    TagType.general,
    TagType.houses,
    TagType.health,
    TagType.animals,
    TagType.shelters,
    TagType.anxiety,
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                              value: orderEntity.amount,
                              title: orderEntity.title,
                              helpedName: orderEntity.cooperated?.name ?? '',
                              localName: orderEntity.address,
                              dateString: DateAdapter.dateToString(orderEntity.createdAt),
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemCount: 5,
                        ),
                      ),
                    HomeError() => Container(),
                    _ => Container(),
                  };
                })
          ],
        ),
      ),
    );
  }
}
