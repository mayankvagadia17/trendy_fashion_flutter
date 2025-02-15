import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.brown),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: "Search",
                prefixIcon: const Icon(Icons.search, color: Colors.brown),
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {}, // Handle filter click
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: Colors.brown,
              ),
              child: const Icon(Icons.tune, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
