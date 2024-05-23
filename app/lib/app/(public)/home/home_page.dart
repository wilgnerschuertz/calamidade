import 'package:coopartilhar/app/(public)/home/widgets/coo_app_bar.dart';
import 'package:coopartilhar/app/(public)/home/widgets/coo_navigator_bar.dart';
import 'package:coopartilhar/app/(public)/home/widgets/search_widget.dart';
import 'package:coopartilhar/app/features/home/interactor/controllers/home_controller.dart';
import 'package:coopartilhar/app/features/home/interactor/entities/request_list_entity.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = injector.get<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    /// TODO: Back-end ainda não tem API pra essa tela.

    return Stack(children: [
      Scaffold(
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
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ValueListenableBuilder(
              valueListenable: homeController,
              builder: (context, state, __) {
                return switch (state) {
                  SuccessState(:final RequestListEntity data) => Column(
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
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              final order = data.requests[index];
                              return CardRequest(
                                onClickArrowRight: () {
                                  Routefly.push(routePaths.requestDetails, arguments: {'id': order.id});
                                },
                                value: order.amount,
                                title: order.title,

                                /// TODO: back-end não retornar nome.
                                helpedName: 'Test',
                                localName: order.description,
                                dateTime: DateAdapter.dateAndHour(order.createdAt),
                              );
                            },
                            separatorBuilder: (_, __) => const SizedBox(height: 16),
                            itemCount: data.requests.length,
                          ),
                        ),
                      ],
                    ),
                  _ => const Center(child: CircularProgressIndicator()),
                };
              }),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SizedBox(
            width: 64,
            height: 64,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                Routefly.push(routePaths.askHelp.newAskHelp);
              },
              shape: const CircleBorder(),
              child: Icon(UIcons.regularStraight.plus, color: colors.white, size: 20),
            ),
          ),
        ),
      ),
    ]);
  }
}
