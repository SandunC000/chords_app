import 'package:flutter/material.dart';

class PrimarySearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  const PrimarySearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      // onChanged: (value) {
      //   setState(() {
      //     _searchQuery = value;
      //   });
      // },
      onChanged: onChanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
