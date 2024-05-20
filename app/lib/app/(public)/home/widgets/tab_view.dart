import 'package:coopartilhar/app/features/home/interactor/home_interactor.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({
    super.key,
    required this.tags,
    required this.onSelected,
  });

  final List<TagType> tags;
  final Function(TagType) onSelected;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final ValueNotifier<int> selectedTag = ValueNotifier<int>(-1);

  List<TagType> get tags => widget.tags;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedTag.value = index;
            });
            widget.onSelected(tags[index]);
          },
          child: Text(
            tags[index].label,
            style: texts.bodyMedium?.copyWith(
              color:
                  index == selectedTag.value ? colors.otherGreen : colors.grey,
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 16),
      itemCount: tags.length,
    );
  }
}
