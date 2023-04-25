import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: TextFormField(
                autofocus: false,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                cursorColor: const Color.fromARGB(255, 0, 0, 0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  prefixIcon: const Icon(Icons.search,
                      color: Color.fromARGB(255, 204, 204, 204)),
                  hintText: "Search...",
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 83, 83, 83)),
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
