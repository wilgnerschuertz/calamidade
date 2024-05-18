import 'package:dashboard/app/(public)/home/new_requests/controllers/new_requests_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewRequestsPage extends StatefulWidget {
  const NewRequestsPage({super.key});

  @override
  State<NewRequestsPage> createState() => _NewRequestsPageState();
}

class _NewRequestsPageState extends State<NewRequestsPage> {
  final NewRequestsController newRequestsController = NewRequestsController();

  @override
  void initState() {
    super.initState();
    newRequestsController.removeLastItemIfOddList(newRequestsController.requestsList);
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.lightGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('Acesso administrativo', style: texts.displayLarge?.copyWith(color: colors.textColor2)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'Solicitações mais antigas',
                          style: texts.bodyMedium?.copyWith(color: colors.textColor2),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Filtrar',
                          style: texts.bodySmall?.copyWith(decoration: TextDecoration.underline, color: colors.textColor2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 180,
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListenableBuilder(
                      listenable: newRequestsController,
                      builder: (context, child) {
                        final entity = newRequestsController.requestsList[index];
                        return NewRequestsCard(
                          title: entity.titleDescription,
                          name: entity.name,
                          city: entity.city,
                          phone: entity.phone,
                          date: entity.date,
                          status: entity.status.label,
                          statusColor: newRequestsController.statusColor[entity.status]!,
                          requestedIncome: entity.requestedIncome,
                          isSelected: newRequestsController.selectedId == entity.id,
                          onTap: () {
                            newRequestsController.selectItem(entity.id);
                          },
                        );
                      },
                    );
                  },
                  childCount: newRequestsController.requestsList.length,
                ),
              ),
            ),
            SliverVisibility(
              visible: newRequestsController.lastItem != null,
              sliver: SliverToBoxAdapter(
                child: ListenableBuilder(
                  listenable: newRequestsController,
                  builder: (context, child) {
                    return NewRequestsCard(
                      title: newRequestsController.lastItem?.description ?? '',
                      name: newRequestsController.lastItem?.name ?? '',
                      city: newRequestsController.lastItem?.city ?? '',
                      phone: newRequestsController.lastItem?.phone ?? '',
                      date: newRequestsController.lastItem?.date ?? '',
                      status: newRequestsController.lastItem?.status.toString() ?? '',
                      statusColor: newRequestsController.statusColor[newRequestsController.lastItem?.status]!,
                      requestedIncome: newRequestsController.lastItem?.requestedIncome ?? '',
                      isSelected: true,
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
