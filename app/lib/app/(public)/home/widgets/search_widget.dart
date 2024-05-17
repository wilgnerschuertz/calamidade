import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.hitText,
    required this.onSearch,
  });

  final String hitText;
  final Function(String value) onSearch;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final ValueNotifier<String> searchTerm = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Row(
      children: [
        Flexible(
          child: TextFormField(
            onChanged: (value) {
              searchTerm.value = value;
            },
            decoration: InputDecoration(
              hintText: widget.hitText,
            ),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: InkWell(
            onTap: () => widget.onSearch(searchTerm.value),
            child: Icon(
              UIcons.regularStraight.search,
              color: colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
