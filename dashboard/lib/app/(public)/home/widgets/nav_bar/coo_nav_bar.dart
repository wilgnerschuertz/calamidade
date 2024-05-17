// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core_module/core_module.dart';
import 'package:dashboard/app/(public)/home/widgets/nav_bar/coo_nav_bar_item.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/app/(public)/home/widgets/nav_bar/coo_nav_bar_user_item.dart';

class CooNavBar extends StatelessWidget {
  const CooNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final color = CoopartilharColors.of(context);
    final size = MediaQuery.sizeOf(context);

    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          height: size.height,
          child: Column(
            children: [
              const Center(
                child: Image(
                  image: CooImages.cooBrandHorizontal,
                  width: 200,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: color.grey,
                  height: 2,
                ),
              ),
              const SizedBox(height: 10),
              CooNavBarItem(
                  icon: Icon(UIcons.regularStraight.apps,
                      size: 24, color: color.textColor2),
                  label: 'Dashboard',
                  onPressed: () {}),
              const SizedBox(height: 10),
              CooNavBarItem(
                icon: Icon(UIcons.regularStraight.hand_holding_heart,
                    size: 24, color: color.textColor2),
                label: 'Novas solicitações',
                onPressed: () {},
                numberNotifications: 5,
                showNotifications: true,
              ),
              const SizedBox(height: 10),
              CooNavBarItem(
                  icon: Image(
                      image: CooIcons.cooCheck,
                      height: 24,
                      width: 24,
                      color: color.textColor2),
                  label: 'Solic. aprovadas',
                  onPressed: () {}),
              const SizedBox(height: 10),
              CooNavBarItem(
                  icon: Icon(UIcons.regularRounded.cross_circle,
                      size: 24, color: color.textColor2),
                  label: 'Solic. negadas',
                  onPressed: () {}),
              CooNavBarItem(
                  icon: Icon(UIcons.regularStraight.user,
                      size: 24, color: color.textColor2),
                  label: 'Usuários',
                  onPressed: () {}),
              const Spacer(),
              const CooNavBarUserItem(
                isEmpty: true,
                name: 'Homer Griffin',
                role: 'Logistic Manager',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: color.grey,
                  height: 2,
                ),
              ),
              CooNavBarItem(
                  icon: Icon(UIcons.regularStraight.sign_out_alt,
                      size: 24, color: color.textColor2),
                  label: 'Sair',
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
