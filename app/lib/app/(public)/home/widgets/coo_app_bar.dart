import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooAppBar extends StatelessWidget {
  const CooAppBar({
    super.key,
    this.urlAvatar,
    required this.hasNotification,
    required this.onClickAvatar,
    required this.onClickIconNotification,
  });

  final String? urlAvatar;
  final bool hasNotification;
  final VoidCallback onClickAvatar;
  final VoidCallback onClickIconNotification;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: AppBar(
        title: const Image(
          image: CooImages.cooBrandSmall,
        ),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(UIcons.regularStraight.comments),
                onPressed: onClickIconNotification,
              ),
              if (hasNotification)
                Positioned(
                  right: 12,
                  top: 10,
                  child: Container(
                    height: 13,
                    width: 13,
                    decoration: BoxDecoration(
                      color: colors.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
        leading: Center(
          child: ClipOval(
            child: Stack(
              alignment: Alignment.center,
              children: [
                urlAvatar != null
                    ? SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(urlAvatar.toString()),
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          UIcons.regularStraight.user,
                          color: colors.white,
                          size: 18,
                        ),
                      ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                    onTap: onClickAvatar,
                    borderRadius: BorderRadius.circular(40),
                    child: const SizedBox(
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // child: IconButton(
          //   icon: urlAvatar != null
          //       ? CircleAvatar(
          //           child: Image.network(urlAvatar.toString()),
          //         )
          //       : CircleAvatar(
          //           backgroundColor: colors.grey,
          //           child: Icon(UIcons.regularStraight.user),
          //         ),
          //   onPressed: onClickAvatar,
          //),
        ),
      ),
    );
  }
}
