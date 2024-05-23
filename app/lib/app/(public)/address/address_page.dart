import 'package:coopartilhar/app/features/address/entities/address_entity.dart';
import 'package:coopartilhar/app/features/address/interactor/controllers/address_controller.dart';
import 'package:coopartilhar/app/features/address/interactor/states/address_states.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  final String title;

  const AddressPage({super.key, this.title = 'Selecionar Endereço'});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final AddressController controller = injector.get<AddressController>();

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    // controller.dispose();
    super.dispose();
  }

  void listener() {
    return switch (controller.state) {
      SuccessState() => Routefly.pop(context),
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.title,
            style: textTheme.displayLarge?.copyWith(color: colors.textColor)),
        leading: IconButton(
            icon: Icon(UIcons.regularStraight.angle_small_left),
            onPressed: Navigator.of(context).pop),
        surfaceTintColor: Colors.transparent,
      ),
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, _) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const Image(image: CooImages.cooBackgroundDetails),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (state is AddressLoadingState)
                        const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (state is AddressLoadedState)
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.addresses.length,
                            itemBuilder: (context, i) {
                              final AddressEntity address = state.addresses[i];
                              final bool isSelected =
                                  state.selectedAddress?.id == address.id ||
                                      false;

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: CardAddress(
                                  addressName: '${address.addressName}',
                                  isSelected: isSelected,
                                  street: '${address.street}',
                                  complement: '${address.complement}',
                                  number: '${address.number}',
                                  city: '${address.city}',
                                  onTap: () =>
                                      controller.changeAddress(address),
                                  onTapRemove: () {
                                    controller.removeAddress(address.id!);
                                  },
                                  onTapEdit: () {
                                    // TODO: implementar
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            CooButton(
                              label: 'Confirmar',
                              onPressed: () {
                                if (state is AddressLoadedState &&
                                    state.selectedAddress != null) {
                                  Routefly.pop(context);
                                }
                              },
                              size: const Size(double.infinity, 60),
                              enable: (state is AddressLoadedState &&
                                  state.selectedAddress != null),
                            ),
                            const SizedBox(height: 10),
                            CooButton.outline(
                              label: 'Cadastrar Endereço',
                              size: const Size(double.infinity, 60),
                              onPressed: () async {
                                await Routefly.push(
                                    routePaths.address.newAddress);
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
