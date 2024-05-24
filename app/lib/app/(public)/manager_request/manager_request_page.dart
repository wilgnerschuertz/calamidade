import 'package:coopartilhar/app/(public)/home/widgets/coo_navigator_bar.dart';
import 'package:coopartilhar/app/(public)/manager_request/card_request_status/card_request_status.dart';
import 'package:coopartilhar/app/features/manager_request/interactor/controllers/manager_request_controller_impl.dart';

import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:coopartilhar/app/(public)/home/widgets/coo_app_bar.dart';

class ManagerRequestPage extends StatefulWidget {
  const ManagerRequestPage({super.key});

  @override
  State<ManagerRequestPage> createState() => _ManagerRequestPageState();
}

class _ManagerRequestPageState extends State<ManagerRequestPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final controller = injector.get<ManagerRequestControllerImpl>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    controller.getRequests();
    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    return switch (controller.state) {
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

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
          onClickCooBrand: () {
            Routefly.push(routePaths.home);
          },
          onClickDonate: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Gerenciar solicitações',
                style: textTheme.displayLarge?.copyWith(
                  color: colors.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: colors.cardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  indicatorPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  tabs: [
                    Text(
                      'Para mim',
                      style: textTheme.bodySmall?.copyWith(
                          color: colors.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Para outras pessoas',
                      style: textTheme.bodySmall?.copyWith(
                          color: colors.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, state, __) {
                      if (state is SuccessState) {
                        final data = state.data.forMe;
                        if (data.isEmpty) {
                          return const Center(
                              child: Text('Não há nada por aqui'));
                        }

                        return Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, _) =>
                                  const SizedBox(height: 10),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                return CardRequestStatus(
                                    title: item.title,
                                    name: item.user.name,
                                    description: item.description,
                                    date:
                                        DateAdapter.dateAndHour(item.createdAt),
                                    amount: CurrencyAdapter.doubleToBRL(
                                        item.amount),
                                    city: 'Teste',
                                    type: RequestStatusEntity.accepted);
                              }),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, state, __) {
                      if (state is SuccessState) {
                        final data = state.data.forOthers;

                        if (data.isEmpty) {
                          return const Center(
                              child: Text('Não há nada por aqui'));
                        }

                        return Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, _) =>
                                  const SizedBox(height: 10),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index];
                                return CardRequestStatus(
                                    title: item.title,
                                    name: item.user.name,
                                    description: item.description,
                                    date:
                                        DateAdapter.dateAndHour(item.createdAt),
                                    amount: CurrencyAdapter.doubleToBRL(
                                        item.amount),
                                    city: 'Teste',
                                    type: RequestStatusEntity.accepted);
                              }),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ]),
              ),
            ],
          ),
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
              child: Icon(UIcons.regularStraight.plus,
                  color: colors.white, size: 20),
            ),
          ),
        ),
      ),
    ]);
  }
}
