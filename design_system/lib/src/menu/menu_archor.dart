import 'package:flutter/material.dart';

class CooMenuArchorWidget extends StatefulWidget {
  final List<MenuItemButton> menus;
  const CooMenuArchorWidget({super.key, required this.menus});

  @override
  State<CooMenuArchorWidget> createState() => _CooMenuArchorWidgetState();
}

class _CooMenuArchorWidgetState extends State<CooMenuArchorWidget> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_horiz),
          tooltip: 'Opções',
        );
      },
      menuChildren: widget.menus,
    );
  }
}
