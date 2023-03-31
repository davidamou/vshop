import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AutocompleteSearch extends StatelessWidget {
  final List<String> wordSuggestions;

  const AutocompleteSearch({Key? key, required this.wordSuggestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                maxHeight: 40.0,
              ),
              hintText: 'Search',
              border: InputBorder.none,
              suffixIcon: textEditingController.text.isNotEmpty ? IconButton(
                onPressed: () {
                  textEditingController.clear();
                },
                icon: const Icon(Icons.clear),
              ): null,
            ),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Container(
          color: Colors.white,
          child: Material(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options.elementAt(index);
                return ListTile(
                  minLeadingWidth: 0.0,
                  leading: const Icon(Iconsax.search_normal_1, size: 16.0),
                  title: Text(option),
                  onTap: () {
                    onSelected(option);
                  },
                );
              },
            ),
          ),
        );
      },
      onSelected: (String selection) {},
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return wordSuggestions.where(
          (String option) {
            return option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          },
        );
      },
    );
  }
}
