import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooNavigatorBar extends StatelessWidget {
  const CooNavigatorBar({
    super.key,
    required this.onClickPlus,
    required this.onClickCooBrand,
    required this.onClickDonate,
  });

  final VoidCallback onClickPlus;
  final VoidCallback onClickCooBrand;
  final VoidCallback onClickDonate;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return BottomAppBar(
      height: 75,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: colors.grey),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colors.primary.withOpacity(0.13),
                          borderRadius: const BorderRadius.all(Radius.circular(14)),
                        ),
                        child: const Image(
                          image: CooImages.cooBrandSmall,
                          height: 24,
                          width: 30,
                        ),
                      ),
                      onPressed: onClickCooBrand,
                    ),
                    IconButton(
                      icon: Icon(
                        UIcons.regularStraight.hand_holding_heart,
                        color: Colors.black,
                      ),
                      onPressed: onClickDonate,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(
              onTap: onClickPlus,
              child: Container(
                height: 64,
                width: 64,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Icon(UIcons.regularStraight.plus, color: colors.white, size: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
