import 'package:coopartilhar/app/(public)/home/widgets/coo_app_bar.dart';
import 'package:coopartilhar/app/(public)/home/widgets/coo_navigator_bar.dart';
import 'package:coopartilhar/app/(public)/home/widgets/search_widget.dart';
import 'package:coopartilhar/app/(public)/home/widgets/tab_view.dart';
import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:coopartilhar/injector.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeInteractor = injector.get<HomeInteractor>();
  final List<TagType> tags = [
    TagType.general,
    TagType.houses,
    TagType.health,
    TagType.animals,
    TagType.shelters,
    TagType.anxiety,
  ];
  int selectedTag = 0;

  @override
  void initState() {
    super.initState();
    homeInteractor.getOrders(tags[selectedTag]);
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: CooAppBar(
          // urlAvatar:
          //     'https://s3-alpha-sig.figma.com/img/7d97/2595/ee4b1dc62acec9003a0f23fe10c69f8a?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MiSfMmVwIz4POu26-LpO1uNk3lASdgKTH3LcRt-VmOpGaufZPpPpKOW02upY9lE7X8steA9dXok9lE1XeibYzZ5~xS4ruUQz0u2btQcab8Qb~sENk34ZsBEn~f~HfzvXdOTT9PzYOZbu6QAqYUq-V5TiDFabeU79ckkDxWu4OgQlmIYy9hM8oTSpKiJ5Gvf~h~OjV-ZHFhGcTSl~k4EpjSvu8Lv6JIeSLmfU5Yc1I~DBQAPLrhBceow89ot6VgUxm2wid1fGdy2i7Saz39yRrtYFmDNt-1M-6HyxFpapGk1pfChEq22U8HrTSARFRqkYglQjidmpvsUGkm0aDXw0Sw__',
          hasNotification: true,
          onClickAvatar: () {},
          onClickIconNotification: () {},
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CooNavigatorBar(
        onClickCooBrand: () {},
        onClickDonate: () {},
        onClickPlus: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: SearchWidget(
                hitText: 'O que você está procurando hoje?',
                onSearch: (value) {},
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Solicitações',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: colors.black,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 20,
              child: TabView(
                tags: tags,
                onSelected: (tag) {},
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  //final orderEntity = data[index];
                  return CardRequest(
                    onClickArrowRight: () {},
                    value: 1234.5, //orderEntity.amount,
                    title: 'test', //orderEntity.title,
                    helpedName: 'Fulano de Tal', // orderEntity.cooperated?.name ?? '',
                    localName: 'Rua qualquer coisa', // orderEntity.address,
                    dateTime: DateTime.now(), //DateAdapter.dateToString(orderEntity.createdAt),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
